package com.jejuuniv.softlab.home



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

import org.apache.commons.lang.StringUtils
import org.springframework.web.servlet.ModelAndView

import com.megatome.grails.RecaptchaService

@Transactional(readOnly = true)
class BoardController {

	final String BOARD_NAME = "free_board"

	final String NO_REGISTED_USER_MSG = "등록된 사용자가 아닙니다."
	final String PASSWORD_INCORRECT_MSG = "비밀번호가 일치하지 않습니다. 다시 확인해 주세요."
	
	static allowedMethods = [save: "POST", edit:"POST", update: "POST", delete: "POST"]

	RecaptchaService recaptchaService

	def uploadFileService

	def index(Integer max) {

		params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
		params.offset = (params.offset ? params.int('offset') : 0)
		params.sort = StringUtils.isEmpty(params.sort) ? 'id' : params.sort
		params.order = StringUtils.isEmpty(params.order) ? 'desc' : params.order

		def boardInstanceList;
		def boardInstanceCount;

		// ###################### 검색 쿼리 및 결과 리스트 ######################
		if (params.search) {
			def keyword = params.search.trim()
			boardInstanceList = Board.findAllByTitleLike("%${keyword}%", params)
			boardInstanceCount = Board.countByTitleLike("%${keyword}%")

		}else{
			// ###################### 최초 게시글 목록 불러오기 ######################
			boardInstanceList = Board.list(params)
			boardInstanceCount = Board.count()
		}
		return render(view: "index",  model:[boardInstanceList : boardInstanceList, boardInstanceCount: boardInstanceCount, filterParams: params])
	}

	def show(Board boardInstance) {
		return render(view: "show",  model:[boardInstance : boardInstance])
	}

	def create() {
		return render(view: "create")
	}

	@Transactional
	def save(Board boardInstance) {

		// ###################### 리캡차 인증여부 체크 ######################
		boolean	recaptchaOK = recaptchaService.verifyAnswer(session, request.getRemoteAddr(), params)
		if(!recaptchaOK){
			return render(view: "create")
		}

		if (boardInstance) {

			// ###################### 작성자 IP 저장 ######################
			boardInstance.writerIP = request.remoteAddr;

			// ###################### 업로드 파일 존재여부 체크 ######################
			def inputFile = request.getFile('upload_file')
			if(!inputFile.empty) {
				boardInstance.uploadFile = fileUpload(inputFile, BOARD_NAME)
			}

			// ###################### 게시글 도메인 저장여부 체크 ######################
			if (!boardInstance.save(flush: true)) {
				return render(view: "create")
			}
			redirect (action: "show", id: boardInstance.id)
		}else{
			notFound()
			return
		}
	}

	def edit(Board boardInstance) {
		def viewName = "/board/edit"
		// ###################### 등록 시 입력한 비밀번호 확인 여부 체크 ######################
		if(boardInstance.password != params.confirmPw){
			viewName = "/board/show"
		}
		return render(view: viewName, model:[boardInstance : boardInstance, msg : PASSWORD_INCORRECT_MSG])
	}

	@Transactional
	def update(Board boardInstance) {

		if (boardInstance) {
			// ###################### 작성자 IP 저장 ######################
			boardInstance.writerIP = request.remoteAddr;

			// ###################### 업로드 파일 존재여부 체크 ######################
			def inputFile = request.getFile('upload_file')
			if(!inputFile.empty) {
				// ###################### 기존에 저장된 업로드 파일이 있을경우, 파일 삭제 ######################
				def alreadyExistedUploadFile = boardInstance.uploadFile
				if(alreadyExistedUploadFile){
					fileDelete(alreadyExistedUploadFile.id)
				}
				boardInstance.uploadFile = fileUpload(inputFile, BOARD_NAME)
			}
			// ###################### 레포트 도메인 저장여부 체크 ######################
			if (!boardInstance.save(flush: true)) {
				return render(view: "edit")
			}
			redirect(action: "show", id: boardInstance.id)
		}else{
			notFound()
			return
		}
	}

	@Transactional
	def delete(Board boardInstance) {
		// ###################### 등록 시 입력한 비밀번호 확인 여부 체크 ######################
		if(boardInstance.password == params.confirmPw){
			if (boardInstance) {
				// ###################### 기존에 저장된 업로드 파일이 있을경우, 파일 삭제 ######################
				def alreadyExistedUploadFile = boardInstance.uploadFile
				if(alreadyExistedUploadFile){
					fileDelete(alreadyExistedUploadFile.id)
				}
				boardInstance.delete flush:true

				redirect (action:"index", method:"GET")
			}else{
				notFound()
				return
			}
		}else{
			return render(view: "/board/show", model:[boardInstance : boardInstance, msg : PASSWORD_INCORRECT_MSG])
		}
	}

	// ###################### 파일 다운로드 ######################
	def fileDownload(){
		uploadFileService.download(params.id)
	}

	// ###################### 파일 업로드 ######################
	def fileUpload(file, userDirName) {
		return uploadFileService.upload(file, userDirName)
	}

	// ###################### 파일 삭제 ######################
	def fileDelete(fildId) {
		return uploadFileService.delete(fildId)
	}

	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'board.label', default: 'Board'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}

package com.jejuuniv.softlab.home



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

import org.apache.commons.lang.StringUtils
import org.springframework.web.servlet.ModelAndView

import com.megatome.grails.RecaptchaService

@Transactional(readOnly = true)
class AndroidReportController {

	final String SUBJECT_NAME = Subject.android.value
	final String BOARD_NAME = "csharp_board"
	final String DELETE_LOG_FILE_NAME = "delete.log"

	final String NO_REGISTED_USER_MSG = "등록된 사용자가 아닙니다."
	final String PASSWORD_INCORRECT_MSG = "비밀번호가 일치하지 않습니다. 다시 확인해 주세요."

	final String NO_BOARD_USER_MSG = SUBJECT_NAME + " 게시판 사용자가 아닙니다."

	static allowedMethods = [login:"POST", save: "POST", edit:"POST", update: "POST", delete: "POST"]

	RecaptchaService recaptchaService


	def uploadFileService

	def	fileInputOutputService

	def index(Integer max) {

		params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
		params.offset = (params.offset ? params.int('offset') : 0)
		params.sort = StringUtils.isEmpty(params.sort) ? 'id' : params.sort
		params.order = StringUtils.isEmpty(params.order) ? 'desc' : params.order

		def reportInstanceList;
		def reportInstanceCount;

		if(params.search){
			// ###################### 쿼리 검색 결과 리스트 ######################
			def keyword = params.search.trim()
			reportInstanceList = AndroidReport.findAllByStdNumLike("%${keyword}%", params)
			reportInstanceCount = AndroidReport.countByStdNumLike("%${keyword}%")
		}else{
			// ###################### 최초 레포트 목록 불러오기 ######################
			reportInstanceList = AndroidReport.list(params)
			reportInstanceCount = AndroidReport.count()
		}
		return render(view: "/report/index", model:[subjectName : SUBJECT_NAME, reportInstanceList : reportInstanceList, reportInstanceCount: reportInstanceCount, filterParams: params])
	}

	def show(AndroidReport reportInstance) {
		return render(view: "/report/show", model:[subjectName : SUBJECT_NAME, reportInstance : reportInstance])
	}

	def login(){
		// ###################### 유저확인 체크 ######################
		def confirmUser = User.findByUserIdAndUserPw(params.userId, params.userPw)
		if(confirmUser){
			// ###################### 레포트 게시판 유저확인 체크 ######################
			if(confirmUser.userRole == UserRole.androidUser || confirmUser.userRole == UserRole.admin){
				return render(view: "/report/create", model:[subjectName : SUBJECT_NAME])
			}else{
				return render(view: "/report/login", model:[subjectName : SUBJECT_NAME, msg : NO_BOARD_USER_MSG])
			}
		}else{
			return render(view: "/report/login", model:[subjectName : SUBJECT_NAME, msg : NO_REGISTED_USER_MSG])
		}
	}

	def create() {
		return render(view: "/report/login",  model:[subjectName:SUBJECT_NAME])
	}

	@Transactional
	def save(AndroidReport reportInstance) {

		// ###################### 리캡차 인증여부 체크 ######################
		boolean	recaptchaOK = recaptchaService.verifyAnswer(session, request.getRemoteAddr(), params)
		if(!recaptchaOK){
			render(view: "/report/create", model:[subjectName:SUBJECT_NAME])
			return
		}

		if (reportInstance) {

			// ###################### 업로드 파일 존재여부 체크 ######################
			def inputFile = request.getFile('upload_file')
			if(!inputFile.empty) {
				reportInstance.uploadFile = fileUpload(inputFile, reportInstance)
			}

			// ###################### 레포트 도메인 저장여부 체크 ######################
			if (!reportInstance.save(flush: true)) {
				return render(view: "/report/create", model:[subjectName:SUBJECT_NAME])
			}
			redirect (action: "show", id: reportInstance.id)
		}else{
			notFound()
			return
		}
	}

	def edit(AndroidReport reportInstance) {
		def viewName = "/report/edit"
		// ###################### 등록 시 입력한 비밀번호 확인 여부 체크 ######################
		if(reportInstance.password != params.confirmPw){
			viewName = "/report/show"
		}

		return render(view: viewName, model:[subjectName : SUBJECT_NAME, reportInstance : reportInstance, msg : PASSWORD_INCORRECT_MSG])
	}

	@Transactional
	def update(AndroidReport reportInstance) {
		// ###################### 등록 시 입력한 비밀번호 확인 여부 체크 ######################
		if(reportInstance.password == params.confirmPw){
			if (reportInstance) {
				// ###################### 업로드 파일 존재여부 체크 ######################
				def inputFile = request.getFile('upload_file')
				if(!inputFile.empty) {
					// ###################### 기존에 저장된 업로드 파일이 있을경우, 파일 삭제 ######################
					def alreadyExistedUploadFile = reportInstance.uploadFile
					if(alreadyExistedUploadFile){
						fileDelete(alreadyExistedUploadFile.id)
					}
					reportInstance.uploadFile = fileUpload(inputFile, reportInstance)
				}
				// ###################### 레포트 도메인 저장여부 체크 ######################
				if (!reportInstance.save(flush: true)) {
					return render(view: "/report/edit")
				}
				redirect(action: "show", id: reportInstance.id)
			}else{
				notFound()
				return
			}
		}else{
			return render(view: "/report/show", model:[subjectName : SUBJECT_NAME, reportInstance : reportInstance])
		}
	}

	@Transactional
	def delete(AndroidReport reportInstance) {

		// ###################### 등록 시 입력한 비밀번호 확인 여부 체크 ######################
		if(reportInstance.password == params.confirmPw){
			if (reportInstance) {
				// ###################### 기존에 저장된 업로드 파일이 있을경우, 파일 삭제 ######################
				def alreadyExistedUploadFile = reportInstance.uploadFile
				if(alreadyExistedUploadFile){
					fileDelete(alreadyExistedUploadFile.id)
				}
				reportInstance.delete flush:true
				// ###################### 삭제된 레포트 로그 남기기 ######################
				fileInputOutputService.writeMessage(BOARD_NAME, DELETE_LOG_FILE_NAME, reportInstance.toString())

				redirect (action:"index", method:"GET")
			}else{
				notFound()
				return
			}
		}else{
			return render(view: "/report/show", model:[subjectName : SUBJECT_NAME, reportInstance : reportInstance, msg : PASSWORD_INCORRECT_MSG])
		}
	}

	// ###################### 파일 다운로드 ######################
	def fileDownload(){
		uploadFileService.download(params.id)
	}

	// ###################### 파일 업로드 ######################
	def fileUpload(file, reportInstance) {
		def userDirName = BOARD_NAME + File.separator + reportInstance.stdNum
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
					message(code: 'javaReport.label', default: 'JavaReport'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}

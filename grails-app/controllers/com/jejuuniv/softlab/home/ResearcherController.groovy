package com.jejuuniv.softlab.home



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

import org.apache.commons.lang.StringUtils

import pl.touk.excel.export.WebXlsxExporter

@Transactional(readOnly = true)
class ResearcherController {

	final String NO_REGISTED_USER_MSG = "등록된 사용자가 아닙니다."

	static allowedMethods = [login: "POST", save: "POST", edit: "POST", update: "POST"]
	def uploadFileService


	def index(Integer max) {
		if(session.user){
			redirect (action: "list")
		}else{
			render(view: "/report/login")
		}
	}

	def login(){

		// ###################### 유저확인 체크 ######################
		def confirmUser = User.findByUserIdAndUserPw(params.userId, params.userPw)
		if(confirmUser){
			// ###################### 관리자 여부 체크 ######################
			if(confirmUser.userRole == UserRole.admin){
				session.user = "admin"
				redirect (action: "list")
			}else{
				return render(view: "/report/login", model:[msg : NO_REGISTED_USER_MSG])
			}
		}else{
			return render(view: "/report/login", model:[msg : NO_REGISTED_USER_MSG])
		}
	}


	def list(Integer max) {
		if(session.user){
			params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
			params.offset = (params.offset ? params.int('offset') : 0)
			params.sort = StringUtils.isEmpty(params.sort) ? 'id' : params.sort
			params.order = StringUtils.isEmpty(params.order) ? 'desc' : params.order

			def researcherInstanceList;
			def researcherInstanceCount;

			if (params.q) {

				researcherInstanceList = Researcher.createCriteria().list {
					like ("admissionNum", "%${params.q}%")
					order("id", "desc")
				}

				researcherInstanceCount = researcherInstanceList.size()
			}else{
				researcherInstanceList = Researcher.list(params)
				researcherInstanceCount = Researcher.count()
			}
			return render(view: "index", model: [researcherInstanceList : researcherInstanceList, researcherInstanceCount : researcherInstanceCount, filterParams: params])
		}else{
			render(view: "/report/login")
		}
	}

	def create() {
		respond new Researcher(params)
	}

	@Transactional
	def save(Researcher researcherInstance) {
		if (researcherInstance) {
			// ###################### 업로드 파일 존재여부 체크 ######################
			def inputFile = request.getFile('upload_file')
			if(!inputFile.empty) {
				researcherInstance.uploadFile = fileUpload(inputFile)
			}

			// ###################### 레포트 도메인 저장여부 체크 ######################
			if (!researcherInstance.save(flush: true)) {
				return render(view: "/create")
			}
			redirect (action: "index")
		}else{
			notFound()
			return
		}
	}

	def edit(Researcher researcherInstance) {
		respond researcherInstance
	}

	@Transactional
	def update(Researcher researcherInstance) {
		if (researcherInstance) {
			// ###################### 업로드 파일 존재여부 체크 ######################
			def inputFile = request.getFile('upload_file')
			if(!inputFile.empty) {
				// ###################### 기존에 저장된 업로드 파일이 있을경우, 파일 삭제 ######################
				def alreadyExistedUploadFile = researcherInstance.uploadFile
				if(alreadyExistedUploadFile){
					fileDelete(alreadyExistedUploadFile.id)
				}
				researcherInstance.uploadFile = fileUpload(inputFile)
			}
			// ###################### 레포트 도메인 저장여부 체크 ######################
			if (!researcherInstance.save(flush: true)) {
				return render(view: "/edit")
			}
			redirect(action: "index")
		}else{
			notFound()
			return
		}
	}

	def downloadExcel() {
		def headers = ['학번', '이름', '이메일', '전화번호']
		def withProperties = [
			'name',
			'admissionNum',
			'phoneNum',
			'email'
		]
		new WebXlsxExporter().with {
			setWorksheetName("연구원 명단")
			setResponseHeaders(response)
			fillHeader(headers)
			add(Researcher.list(), withProperties)
			save(response.outputStream)
		}
	}

	// ###################### 파일 업로드 ######################
	def fileUpload(file) {
		def dirName = "admin" + File.separator + "researcher_list"
		return uploadFileService.upload(file, dirName);
	}

	// ###################### 파일 삭제 ######################
	def fileDelete(fildId) {
		return uploadFileService.delete(fildId)
	}

	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'researcher.label', default: 'Researcher'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}

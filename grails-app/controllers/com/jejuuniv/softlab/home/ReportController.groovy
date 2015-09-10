package com.jejuuniv.softlab.home



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

import org.apache.commons.lang.StringUtils
import org.springframework.web.servlet.ModelAndView

@Transactional(readOnly = true)
class ReportController {

	final String NO_REGISTED_USER_MSG = "등록된 사용자가 아닙니다."
	
	static allowedMethods = [login:"POST"]

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

	def list(Integer max){
		if(session.user){
			params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
			params.offset = (params.offset ? params.int('offset') : 0)
			params.sort = StringUtils.isEmpty(params.sort) ? 'id' : params.sort
			params.order = StringUtils.isEmpty(params.order) ? 'desc' : params.order

			def reportInstanceList;
			def reportInstanceCount;

			if (params.subject || params.search) {
				// ###################### 쿼리 검색 결과 리스트 ######################
				def subject = params.subject
				def keyword = params.search.trim()

				reportInstanceList = Report.createCriteria().list(params) {
					// ###################### 과목 선택 유무 체크 ######################
					if(subject){
						eq ("subject", Subject.valueOf(subject))
					}
					like ("stdNum", "%${keyword}%")
				}
				reportInstanceCount = reportInstanceList.totalCount
			}else{
				// ###################### 최초 레포트 목록 불러오기 ######################
				reportInstanceList = Report.list(params)
				reportInstanceCount = Report.count()
			}
			return render(view: "/report/all", model: [reportInstanceList : reportInstanceList, reportInstanceCount : reportInstanceCount, filterParams: params])
		}else{
			render(view: "/report/login")
		}
	}

	def show(Report reportInstance) {
		if(session.user){
			return render(view: "/report/show", model: [reportInstance : reportInstance])
		}else{
			render(view: "/report/login")
		}
	}

	def fileDownload(){
		uploadFileService.download(params.id)
	}

	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'dataStrReport.label', default: 'DataStrReport'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}

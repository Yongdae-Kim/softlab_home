package com.jejuuniv.softlab.home



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

import org.apache.commons.lang.StringUtils

import pl.touk.excel.export.WebXlsxExporter


@Transactional(readOnly = true)
class ResearcherController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def uploadFileService

	def index(Integer max) {

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

		[researcherInstanceList : researcherInstanceList, researcherInstanceCount: researcherInstanceCount]
	}

	def show(Researcher researcherInstance) {
		respond researcherInstance
	}

	def create() {
		respond new Researcher(params)
	}

	@Transactional
	def save(Researcher researcherInstance) {

		def file = request.getFile('upload_file')
		if(!file.empty) {
			researcherInstance.uploadFile = upload(file)
		}

		if (!researcherInstance.save(flush: true)) {
			render(view: "create")
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'boardInstance.label', default: 'Board'),
			researcherInstance.id
		])
		redirect(action: "show", id: researcherInstance.id)
	}

	def edit(Researcher researcherInstance) {
		respond researcherInstance
	}

	@Transactional
	def update(Researcher researcherInstance) {
		if (researcherInstance == null) {
			notFound()
			return
		}

		if (researcherInstance.hasErrors()) {
			respond researcherInstance.errors, view:'edit'
			return
		}

		researcherInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Researcher.label', default: 'Researcher'),
					researcherInstance.id
				])
				redirect researcherInstance
			}
			'*'{ respond researcherInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(Researcher researcherInstance) {

		if (researcherInstance == null) {
			notFound()
			return
		}

		researcherInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'Researcher.label', default: 'Researcher'),
					researcherInstance.id
				])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
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
	def download(){
		uploadFileService.download(params.id);
	}

	def upload(file) {
		def dirName = "admin" + File.separator + "researcher_list"
		return uploadFileService.upload(file, dirName);
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

package com.jejuuniv.softlab.home

import grails.transaction.Transactional

import org.codehaus.groovy.grails.web.util.WebUtils

@Transactional
class UploadFileService {
		
	def upload(file, userFolder) {
		def uploadDir = new File("web-app/upload_folder", userFolder)
		uploadDir.mkdirs()

		def timestamp = System.currentTimeMillis()

		def fileName = timestamp + "_"+ file.originalFilename;

		def userUploadFile = new File(uploadDir, fileName);
		file.transferTo(userUploadFile)

		def userUploadFileInstance = new UploadFile()

		userUploadFileInstance.name = fileName
		userUploadFileInstance.path = userUploadFile.absolutePath
		userUploadFileInstance.size = file.size

		userUploadFileInstance.save(flush: true)

		return userUploadFileInstance
	}

	def download(fileId){
		def selectedUploadFile = UploadFile.findById(fileId)
		def file = new File(selectedUploadFile.path)

		def webUtils = WebUtils.retrieveGrailsWebRequest()
		def response = webUtils.getCurrentResponse()

		response.setContentType("application/octet-stream")
		response.setHeader("Content-disposition", "attachment;filename=${file.getName()}")
		response.outputStream << file.newInputStream()
	}

	def delete(fileId) {

		def selectedFile = UploadFile.findById(fileId)

		boolean fileSuccessfullyDeleted

		if(selectedFile){
			def file = new File(selectedFile.path)

			if(file.exists())
				fileSuccessfullyDeleted = file.delete()
		}

		return fileSuccessfullyDeleted
	}
}

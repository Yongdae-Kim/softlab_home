package com.jejuuniv.softlab.home

class UploadFile {

	String name
	String path
	Long size

	Date dateCreated
	Date lastUpdated

	static belongsTo = [Board, Report, Researcher]

	static constraints = {
		name(blank:false,nullable:false)
		path(blank:false,nullable:false)
		size(blank:false,nullable:false)
	}
}

package com.jejuuniv.softlab.home

import javax.persistence.CascadeType
import javax.persistence.ManyToOne


class Board {
	
	String writer
	String writerEmail

	String writerIP

	String title
	String contents

	String password

	Date dateCreated
	Date lastUpdated
	
	UploadFile uploadFile

	static hasMany = [ uploadFile : UploadFile ]
	
	static constraints = {
		writer(blank:false,nullable:false)
		writerEmail(blank:false,nullable:false)
		writerIP(blank:false,nullable:false)
		title(blank:false,nullable:false)
		contents(blank:true,nullable:true)
		password(blank:false,nullable:false)
		uploadFile(blank:true,nullable:true)
	}
}

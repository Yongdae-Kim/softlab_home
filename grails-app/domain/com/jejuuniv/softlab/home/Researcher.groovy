package com.jejuuniv.softlab.home

import java.text.SimpleDateFormat

class Researcher {

	String admissionNum
	String name

	String email
	String phoneNum

	UploadFile uploadFile

	Date dateCreated
	Date lastUpdated

	static constraints = {
		name(blank:false,nullable:false)
		admissionNum(blank:true,nullable:true)
		email(blank:true,nullable:true)
		phoneNum(blank:true,nullable:true)
		uploadFile(blank:true,nullable:true)
	}

	def beforeInsert = {
		if(admissionNum.is(null)){
			admissionNum = '1900'
		}
	}
}

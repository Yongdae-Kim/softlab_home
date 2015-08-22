package com.jejuuniv.softlab.home

class SoftEngReport extends Report{

	Subject subject

	static constraints = {
		subject(blank:true,nullable:true)
	}

	def beforeInsert = { subject = Subject.softEng }

	@Override
	public String toString() {
		return super.toString()
	}
}

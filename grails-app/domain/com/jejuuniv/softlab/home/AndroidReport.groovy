package com.jejuuniv.softlab.home

class AndroidReport extends Report{

	Subject subject

	static constraints = {
		subject(blank:true,nullable:true)
	}

	def beforeInsert = { subject = Subject.android }
	
	@Override
	public String toString() {
		return super.toString()
	}
}

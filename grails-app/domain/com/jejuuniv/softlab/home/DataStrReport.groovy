package com.jejuuniv.softlab.home

class DataStrReport extends Report{

	Subject subject

	static constraints = {
		subject(blank:true,nullable:true)
	}

	def beforeInsert = { subject = Subject.dataStr }
	
	@Override
	public String toString() {
		return super.toString()
	}
}

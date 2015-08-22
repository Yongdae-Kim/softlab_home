package com.jejuuniv.softlab.home

class CsharpReport extends Report{

	Subject subject

	static constraints = {
		subject(blank:true,nullable:true)
	}

	def beforeInsert = { subject = Subject.csharp }
	
	@Override
	public String toString() {
		return super.toString()
	}
}

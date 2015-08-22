package com.jejuuniv.softlab.home

import org.mozilla.classfile.SuperBlock;

class JavaReport extends Report{


	Subject subject

	static constraints = {
		subject(blank:true,nullable:true)
	}

	def beforeInsert = { subject = Subject.java }

	@Override
	public String toString() {
		return super.toString()
	}
}

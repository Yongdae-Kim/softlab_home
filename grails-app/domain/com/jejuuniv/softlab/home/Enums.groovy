package com.jejuuniv.softlab.home

enum Grade {
	first('1학년'), second('2학년'), third('3학년'), fourth('4학년')

	final String value

	Grade(String value) {
		this.value = value
	}
}

enum Subject {
	softEng('소프트웨어공학'), java('JAVA'), csharp('C#'), android('Android'), dataStr('자료구조')

	final String value

	Subject(String value) {
		this.value = value
	}
}

enum UserRole {



	admin('관리자'), javaUser(Subject.java.value + " 사용자"), dataStrUser(Subject.dataStr.value + " 사용자"),
	csharpUser(Subject.csharp.value + " 사용자"), softEngUser(Subject.softEng.value + " 사용자"),
	androidUser(Subject.android.value + " 사용자")

	final String value

	UserRole(String value) {
		this.value = value
	}
}

class Enums {
}
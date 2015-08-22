package com.jejuuniv.softlab.home


class Report {


	String major
	Grade grade

	String stdNum
	String stdName
	String stdEmail

	String title
	String contents
	String password

	UploadFile uploadFile

	Date dateCreated
	Date lastUpdated

	static hasMany = [ uploadFile : UploadFile ]

	static constraints = {

		major(blank:false,nullable:false)
		grade(blank:false,nullable:false)

		stdNum(blank:false,nullable:false,maxSize: 50)
		stdName(blank:false,nullable:false,maxSize: 50)
		stdEmail(blank:false,nullable:false,maxSize: 50)

		title(blank:false,nullable:false,maxSize: 100)
		contents(blank:true,nullable:true,maxSize: 3000)
		password(blank:false,nullable:false,maxSize: 10)

		uploadFile(blank:true,nullable:true)
	}

	@Override
	public String toString() {

		return [아이디 : id,
			전공 : major,
			학년 : grade,
			학번 : stdNum,
			이름 : stdName,
			이메일 : stdEmail,
			제목 : title,
			내용 : contents,
			비밀번호 : password,
			업로드파일아이디 : uploadFile?.id,
			업드로파일이름 : uploadFile?.path,
			업로드파일크기 : uploadFile?.size,
			등록시간 : dateCreated,
			수정시간 : lastUpdated ]
	}
}

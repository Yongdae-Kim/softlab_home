<%-- #################### 'create' 에서 사용 #################### --%>
<%-- #################### 'edit' 에서 사용 #################### --%>

<%@ page import="com.jejuuniv.softlab.home.Grade"%>

<div class="form-group">
	<label>전 공</label>
	<div class="input-group">
		<g:textField name="major" class="form-control"
			value="${fieldValue(bean: reportInstance, field: 'major')}"
			required="required" placeholder="학과를 입력하세요." />
		<span class="input-group-addon"><span
			class="glyphicon glyphicon-asterisk"></span></span>
	</div>
</div>
<div class="form-group">
	<label>과 목 </label>
	<div class="input-group">
		<g:textField name="major" class="form-control" value="${subjectName}"
			disabled="disabled" required="required" />
		<span class="input-group-addon"><span
			class="glyphicon glyphicon-asterisk"></span></span>
	</div>
</div>
<div class="form-group">
	<label>학 번</label>
	<div class="input-group">
		<g:field type="number" name="stdNum" class="form-control"
			value="${fieldValue(bean: reportInstance, field: 'stdNum')}"
			required="required" placeholder="학번을 입력하세요." />
		<span class="input-group-addon"><span
			class="glyphicon glyphicon-asterisk"></span></span>
	</div>
</div>
<div class="form-group">
	<label>학 년</label>
	<div class="input-group">
		<g:select name="grade" class="form-control" from="${Grade.values()}"
			keys="${Grade.values()*.name()}" optionValue="value"
			required="required" />
		<span class="input-group-addon"><span
			class="glyphicon glyphicon-asterisk"></span></span>
	</div>
</div>
<div class="form-group">
	<label>이 름</label>
	<div class="input-group">
		<g:textField name="stdName" class="form-control"
			value="${fieldValue(bean: reportInstance, field: 'stdName')}"
			required="required" placeholder="이름을 입력하세요." />
		<span class="input-group-addon"><span
			class="glyphicon glyphicon-asterisk"></span></span>
	</div>
</div>
<div class="form-group">
	<label>이 메 일</label>
	<div class="input-group">
		<g:field type="email" name="stdEmail" class="form-control"
			value="${fieldValue(bean: reportInstance, field: 'stdEmail')}"
			required="required" placeholder="이메일을 입력하세요." />
		<span class="input-group-addon"><span
			class="glyphicon glyphicon-asterisk"></span></span>
	</div>
</div>
<div class="form-group">
	<label>제 목</label>
	<div class="input-group">
		<g:textField name="title" class="form-control"
			value="${fieldValue(bean: reportInstance, field: 'title')}"
			required="required" placeholder="제목을 입력하세요." />
		<span class="input-group-addon"><span
			class="glyphicon glyphicon-asterisk"></span></span>
	</div>
</div>
<div class="form-group">
	<label>내 용</label>
	<div class="input-group">
		<g:textArea name="contents" class="form-control" rows="5"
			value="${fieldValue(bean: reportInstance, field: 'contents')}"
			placeholder="내용을 입력하세요." />
		<span class="input-group-addon"></span>
	</div>
</div>
<div class="form-group">
	<label>업 로 드 파 일</label>
	<div class="input-group">
		<input type="file" id="input_file" name="upload_file"
			class="form-control" /> <span class="input-group-addon"></span>
	</div>
</div>
<div class="form-group">
	<label>비 밀 번 호</label>
	<div class="input-group">
		<g:passwordField type="password" name="password" class="form-control"
			value="${fieldValue(bean: reportInstance, field: 'password')}"
			required="required" placeholder="문서 열람을 위한 비밀번호를 입력하세요." />
		<span class="input-group-addon"><span
			class="glyphicon glyphicon-asterisk"></span></span>
	</div>
</div>
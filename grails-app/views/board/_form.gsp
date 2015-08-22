<%-- #################### 'create' 에서 사용 #################### --%>
<%-- #################### 'edit' 에서 사용 #################### --%>

<div class="form-group">
	<label>작 성 자</label>
	<div class="input-group">
		<g:textField name="writer" class="form-control"
			value="${fieldValue(bean: boardInstance, field: 'writer')}"
			required="required" placeholder="이름을 입력하세요." />
		<span class="input-group-addon"><span
			class="glyphicon glyphicon-asterisk"></span></span>
	</div>
</div>
<div class="form-group">
	<label>이 메 일</label>
	<div class="input-group">
		<g:field type="email" name="writerEmail" class="form-control"
			value="${fieldValue(bean: boardInstance, field: 'writerEmail')}"
			required="required" placeholder="이메일을 입력하세요." />
		<span class="input-group-addon"><span
			class="glyphicon glyphicon-asterisk"></span></span>
	</div>
</div>
<div class="form-group">
	<label>제 목</label>
	<div class="input-group">
		<g:textField name="title" class="form-control"
			value="${fieldValue(bean: boardInstance, field: 'title')}"
			required="required" placeholder="제목을 입력하세요." />
		<span class="input-group-addon"><span
			class="glyphicon glyphicon-asterisk"></span></span>
	</div>
</div>
<div class="form-group">
	<label>내 용</label>
	<div class="input-group">
		<g:textArea name="contents" class="form-control" rows="5"
			value="${fieldValue(bean: boardInstance, field: 'contents')}"
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
			value="${fieldValue(bean: boardInstance, field: 'password')}"
			required="required" placeholder="문서 열람을 위한 비밀번호를 입력하세요." />
		<span class="input-group-addon"><span
			class="glyphicon glyphicon-asterisk"></span></span>
	</div>
</div>
<div class="form-group">
	<label>이 름</label>
	<div class="input-group">
		<g:textField name="name" class="form-control"
			value="${fieldValue(bean: researcherInstance, field: 'name')}"
			required="required" placeholder="이름을 입력하세요." />
		<span class="input-group-addon"><span
			class="glyphicon glyphicon-asterisk"></span></span>
	</div>
</div>
<div class="form-group">
	<label>입학년도</label>
	<div class="input-group">
		<g:field type="number" name="admissionNum" class="form-control"
			value="${fieldValue(bean: researcherInstance, field: 'admissionNum')}"
			placeholder="입학년도를 입력하세요." />
		<span class="input-group-addon"></span>
	</div>
</div>
<div class="form-group">
	<label>연 락 처</label>
	<div class="input-group">
		<g:field type="tel" name="phoneNum" class="form-control"
			value="${fieldValue(bean: researcherInstance, field: 'phoneNum')}"
			placeholder="연락처를 입력하세요." />
		<span class="input-group-addon"><span
			class="glyphicon glyphicon-asterisk"></span></span>
	</div>
</div>
<div class="form-group">
	<label>이 메 일</label>
	<div class="input-group">
		<g:field type="email" name="email" class="form-control"
			value="${fieldValue(bean: researcherInstance, field: 'email')}"
			placeholder="이메일을 입력하세요." />
		<span class="input-group-addon"><span
			class="glyphicon glyphicon-asterisk"></span></span>
	</div>
</div>
<div class="form-group">
	<label>사진 등록</label>
	<div class="input-group">
		<input type="file" id="input_file" multiple accept='image/*'
			name="upload_file" class="form-control" /> <span
			class="input-group-addon"></span>
	</div>
</div>
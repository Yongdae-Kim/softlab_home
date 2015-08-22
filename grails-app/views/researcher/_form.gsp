<%@ page import="com.jejuuniv.softlab.home.Researcher"%>



<div
	class="fieldcontain ${hasErrors(bean: researcherInstance, field: 'admissionDate', 'error')} ">
	<label for="admissionDate"> <g:message
			code="researcher.admissionDate.label" default="Admission Date" />

	</label>
	<g:datePicker name="admissionDate" precision="day"
		value="${researcherInstance?.admissionDate}" default="none"
		noSelection="['': '']" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: researcherInstance, field: 'name', 'error')} required">
	<label for="name"> <g:message code="researcher.name.label"
			default="Name" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required=""
		value="${researcherInstance?.name}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: researcherInstance, field: 'email', 'error')} ">
	<label for="email"> <g:message code="researcher.email.label"
			default="Email" />

	</label>
	<g:textField name="email" value="${researcherInstance?.email}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: researcherInstance, field: 'phoneNum', 'error')} ">
	<label for="phoneNum"> <g:message
			code="researcher.phoneNum.label" default="Phone Num" />

	</label>
	<g:textField name="phoneNum" value="${researcherInstance?.phoneNum}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: researcherInstance, field: 'uploadFile', 'error')} ">
	<label for="uploadFile"> <g:message
			code="researcher.uploadFile.label" default="Upload File" />

	</label>
	<g:select id="uploadFile" name="uploadFile.id"
		from="${com.jejuuniv.softlab.home.UploadFile.list()}" optionKey="id"
		value="${researcherInstance?.uploadFile?.id}" class="many-to-one"
		noSelection="['null': '']" />

</div>



<%@ page import="com.jejuuniv.softlab.home.Researcher" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'researcher.label', default: 'Researcher')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-researcher" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-researcher" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list researcher">
			
				<g:if test="${researcherInstance?.admissionNum}">
				<li class="fieldcontain">
					<span id="admissionDate-label" class="property-label"><g:message code="researcher.admissionDate.label" default="Admission Date" /></span>
					
						<span class="property-value" aria-labelledby="admissionDate-label">${researcherInstance?.admissionNum}</span>
					
				</li>
				</g:if>
			
				<g:if test="${researcherInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="researcher.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${researcherInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${researcherInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="researcher.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${researcherInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${researcherInstance?.phoneNum}">
				<li class="fieldcontain">
					<span id="phoneNum-label" class="property-label"><g:message code="researcher.phoneNum.label" default="Phone Num" /></span>
					
						<span class="property-value" aria-labelledby="phoneNum-label"><g:fieldValue bean="${researcherInstance}" field="phoneNum"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${researcherInstance?.uploadFile}">
				<li class="fieldcontain">
					<span id="uploadFile-label" class="property-label"><g:message code="researcher.uploadFile.label" default="Upload File" /></span>
					
						<span class="property-value" aria-labelledby="uploadFile-label"><g:link controller="uploadFile" action="show" id="${researcherInstance?.uploadFile?.id}">${researcherInstance?.uploadFile?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${researcherInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="researcher.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${researcherInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${researcherInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="researcher.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${researcherInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:researcherInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${researcherInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

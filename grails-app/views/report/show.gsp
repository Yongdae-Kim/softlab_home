<%@ page import="com.jejuuniv.softlab.home.Subject"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />

<title>Register Product to OpenMarket</title>

</head>
<body onload=''>
	<section id="intro" class="home-section">
		<div class="container">
			<div class="page-header">
				<h1>
					${subjectName}
					레포트
					<g:link class="btn btn-skin btn-lg" action="index">게시판 목록 보기</g:link>
					<br> <br> <small>After completing the form, Click
						the 'Register' button</small>
				</h1>
			</div>
			<div class="row">
				<div class="col-md-10 col-md-offset-1">

					<ul class="list-group">
						<g:if test="${reportInstance?.major}">
							<li class="list-group-item"><label>전 공 : </label> <g:fieldValue
									bean="${reportInstance}" field="major" /></li>
						</g:if>
						<g:if test="${reportInstance?.subject}">
							<li class="list-group-item"><label>과 목 : </label> <g:fieldValue
									bean="${reportInstance}" field="subject" /></li>
						</g:if>
						<g:if test="${reportInstance?.stdNum}">
							<li class="list-group-item"><label>학 번 : </label> <g:fieldValue
									bean="${reportInstance}" field="stdNum" /></li>
						</g:if>
						<g:if test="${reportInstance?.stdName}">
							<li class="list-group-item"><label>이 름 : </label> <g:fieldValue
									bean="${reportInstance}" field="stdName" /></li>
						</g:if>
						<g:if test="${reportInstance?.stdEmail}">
							<li class="list-group-item"><label>이 메 일 : </label> <g:fieldValue
									bean="${reportInstance}" field="stdEmail" /></li>
						</g:if>
						<g:if test="${reportInstance?.title}">
							<li class="list-group-item"><label>제 목 : </label> <g:fieldValue
									bean="${reportInstance}" field="title" /></li>
						</g:if>
						<g:if test="${reportInstance?.contents}">
							<li class="list-group-item"><label>내 용 : </label> <g:fieldValue
									bean="${reportInstance}" field="contents" /></li>
						</g:if>
						<g:if test="${reportInstance?.uploadFile}">
							<li class="list-group-item"><label>업 로 드 파일 : </label> <g:fieldValue
									bean="${reportInstance}" field="uploadFile.name" /></li>
						</g:if>
						<g:if test="${reportInstance?.lastUpdated}">
							<li class="list-group-item"><label>등 록 일 : </label> <g:formatDate
									type="datetime" style="MEDIUM"
									date="${reportInstance.lastUpdated}" /></li>
						</g:if>
					</ul>
					<br>
					<g:form method="POST" resource="${reportInstance}">
						<div class="form-group">
							<label>비 밀 번 호 확 인</label>
							<div class="input-group">
								<g:textField name="confirmPw" class="form-control"
									placeholder="등록 시 입력하였던 비밀번호를 입력하세요." />
								<span class="input-group-addon"></span>
							</div>
						</div>
						<br>
						<div class="col-md-6">
							<div class="form-group">
								<g:actionSubmit class="btn btn-skin btn-lg btn-block"
									action="edit" value="수 정 하 기" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<g:actionSubmit class="btn btn-skin btn-lg btn-block"
									action="delete" value="삭 제 하 기" />
							</div>
						</div>
					</g:form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>


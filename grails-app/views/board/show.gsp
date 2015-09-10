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
					게시글
					<g:link class="btn btn-skin btn-lg" action="index">목록 보기</g:link>
					<g:if test="${msg}">
						<br>
						<br>
						<small> ${msg}
						</small>
					</g:if>
				</h1>
			</div>
			<div class="row">
				<div class="col-md-10 col-md-offset-1">

					<ul class="list-group">
						<g:if test="${boardInstance?.writer}">
							<li class="list-group-item"><label>작 성 자 : </label> <g:fieldValue
									bean="${boardInstance}" field="writer" /></li>
						</g:if>
						<g:if test="${boardInstance?.writerEmail}">
							<li class="list-group-item"><label>이 메 일 : </label> <g:fieldValue
									bean="${boardInstance}" field="writerEmail" /></li>
						</g:if>
						<g:if test="${boardInstance?.title}">
							<li class="list-group-item"><label>제 목 : </label> <g:fieldValue
									bean="${boardInstance}" field="title" /></li>
						</g:if>
						<g:if test="${boardInstance?.contents}">
							<li class="list-group-item"><label>내 용 : </label> <g:fieldValue
									bean="${boardInstance}" field="contents" /></li>
						</g:if>
						<g:if test="${boardInstance?.uploadFile}">
							<li class="list-group-item"><label>업로드 파일 : </label> <g:fieldValue
									bean="${boardInstance}" field="uploadFile.name" /></li>
						</g:if>
						<g:if test="${boardInstance?.lastUpdated}">
							<li class="list-group-item"><label>등 록 일 : </label> <g:formatDate
									type="datetime" style="MEDIUM"
									date="${boardInstance.lastUpdated}" /></li>
						</g:if>
					</ul>

					<g:form method="POST" resource="${boardInstance}">
						<div class="form-group">
							<label>비 밀 번 호 확 인</label>
							<div class="input-group">
								<g:passwordField name="confirmPw" type="password"
									class="form-control" placeholder="등록 시 입력하였던 비밀번호를 입력하세요." />
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


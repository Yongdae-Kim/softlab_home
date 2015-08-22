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
					게시글 <br> <small>After completing the form, Click the
						'Register' button</small>
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

					<g:form url="[resource:boardInstance, action:'delete']"
						method="DELETE">
						<g:actionSubmit class="btn btn-skin pull-right btn-lg"
							action="delete" value="삭 제 하 기"
							onclick="return confirm('Are you sure?');" />
					</g:form>

					<g:form url="[resource:boardInstance, action:'edit']"
						method="POST">
						<g:actionSubmit class="btn btn-skin pull-right btn-lg"
							action="edit" value="수 정 하 기"></g:actionSubmit>
					</g:form>

				</div>
			</div>
		</div>
	</section>
</body>
</html>


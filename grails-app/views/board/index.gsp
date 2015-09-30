
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />

</head>

<body onload=''>
	<section id="intro" class="home-section text-center">
		<div class="container">
			<div class="page-header">
				<h1>
					자유 게시판 <br> <br> <small>비방 및 광고성은 글은 경고없이 삭제됩니다.</small>
				</h1>
			</div>
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<g:form action="index" id="searchableForm" method="get"
						name="searchableForm">
						<div class="input-group">
							<input type="text" name="q" class="form-control"
								placeholder="검색을 원하는 제목을 입력하세요." value="${params.q}" id="q">
							<span class="input-group-btn"> <input type="submit"
								class="btn btn-default" value="검색하기" />
							</span>
						</div>
					</g:form>

					<br>

					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<g:sortableColumn property="id" title="번 호" />
								<td>제 목</td>
								<td>업로드 파일</td>
								<td>작 성 자</td>
								<g:sortableColumn property="dateCreated" title="작 성 일" />
							</tr>
						</thead>
						<tbody>
							<g:each in="${boardInstanceList}" status="i" var="boardInstance">
								<tr>
									<td>
										${fieldValue(bean: boardInstance, field: "id")}
									</td>
									<td><g:link action="show" id="${boardInstance.id}">
											${fieldValue(bean: boardInstance, field: "title")}
										</g:link></td>
									<td>
										${fieldValue(bean: boardInstance, field: "writer")}
									</td>
									<td><g:if test="${boardInstance?.uploadFile?.path}">
											<g:link action="fileDownload"
												id="${boardInstance.uploadFile.id}">
												${fieldValue(bean: boardInstance, field: "uploadFile.name")}
											</g:link>
										</g:if> <g:else>업로드 파일 없음</g:else></td>
									<td><g:formatDate type="datetime" style="MEDIUM"
											date="${boardInstance.lastUpdated}" /></td>
								</tr>
							</g:each>
						</tbody>
					</table>
					<div class="paginateButtons">
						<g:paginate next="다 음" prev="이 전" maxsteps="0" action="index"
							total="${boardInstanceCount}" params="${filterParams}" />
					</div>
					<g:link class="btn btn-skin pull-right btn-lg" action="create">게시글 작성하기</g:link>
				</div>
			</div>
		</div>
	</section>
</body>
</html>

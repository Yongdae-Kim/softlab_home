<%@ page import="com.jejuuniv.softlab.home.Subject"%>

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
					${subjectName}
					레포트 게시판 <br> <br> <small>'레포트 제출하기' 버튼을 누르면, 레포트를
						게시판에 등록할 수 있습니다.</small>
				</h1>
			</div>
			<div class="row">
				<div class="col-md-10 col-md-offset-1">

					<%-- ###################### 학번 검색 쿼리 ###################### --%>
					<g:form action="index" id="searchableForm" method="get"
						name="searchableForm">
						<div class="input-group">
							<input type="text" name="search" class="form-control"
								placeholder="검색을 원하는 학번을 입력하세요." value="${params.search}">
							<span class="input-group-btn"> <input type="submit"
								class="btn btn-skin pull-right" value="검색하기" />
							</span>
						</div>
					</g:form>
					<%-- ############################################################ --%>

					<br>

					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<g:sortableColumn property="id" title="번 호" />
								<td>제 목</td>
								<td>이 름</td>
								<g:sortableColumn property="stdNum" title="학 번" />
								<g:sortableColumn property="dateCreated" title="작 성 일" />
							</tr>
						</thead>
						<tbody>
							<g:each in="${reportInstanceList}" status="i"
								var="reportInstance">
								<tr>
									<td>
										${fieldValue(bean: reportInstance, field: "id")}
									</td>
									<td><g:link action="show" id="${reportInstance.id}">
											${fieldValue(bean: reportInstance, field: "title")}
										</g:link></td>
									<td>
										${fieldValue(bean: reportInstance, field: "stdName")}
									</td>

									<td>
										${fieldValue(bean: reportInstance, field: "stdNum")}
									</td>

									<td><g:formatDate type="datetime" style="MEDIUM"
											date="${reportInstance.lastUpdated}" /></td>
								</tr>
							</g:each>
						</tbody>
					</table>
					<div class="paginateButtons">
						<g:paginate next="다 음" prev="이 전" maxsteps="0" action="index"
							total="${reportInstanceCount}" params="${filterParams}" />
					</div>
					<g:link class="btn btn-skin pull-right btn-lg" action="create">레포트 제출하기</g:link>
				</div>
			</div>
		</div>
	</section>
</body>
</html>

<%@ page import="com.jejuuniv.softlab.home.Subject"%>

<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />

<title>Register Product to OpenMarket</title>

</head>
<body onload=''>
	<section id="intro" class="home-section text-center">
		<div class="container">
			<div class="page-header">
				<h1>
					전체 레포트 게시판 <br> <br> <small>After completing the
						form, Click the 'Register' button</small>
				</h1>
			</div>
			<div class="row">
				<div class="col-md-12">
					<%-- ###################### 학번, 과목 검색 쿼리 ###################### --%>
					<g:form action="list" id="searchableForm" name="searchableForm">
						<g:select name="subject" class="form-control"
							from="${Subject.values()}" keys="${Subject.values()*.name()}"
							optionValue="value" noSelection="['':'과목을 선택해주세요.']" />
						<div class="input-group">
							<input type="text" name="search" class="form-control"
								placeholder="검색을 원하는 학번을 입력하세요." value="${params.q}"> <span
								class="input-group-btn"> <input type="submit"
								class="btn btn-skin pull-right" value="검색하기" />
							</span>
						</div>
					</g:form>
					<%-- ################################################################# --%>
					<br>

					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<g:sortableColumn property="id" title="아이디" />
								<g:sortableColumn property="subject" title="과 목" />
								<td>제 목</td>
								<td>이 름</td>
								<g:sortableColumn property="stdNum" title="학 번" />
								<td>업로드 파일</td>
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
									<td>
										${fieldValue(bean: reportInstance, field: "subject")}
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
									<td><g:if test="${reportInstance?.uploadFile?.path}">
											<g:link action="fileDownload"
												id="${reportInstance.uploadFile.id}">
												${fieldValue(bean: reportInstance, field: "uploadFile.name")}
											</g:link>
										</g:if> <g:else>업로드 파일 없음</g:else></td>
									<td><g:formatDate type="datetime" style="MEDIUM"
											date="${reportInstance.lastUpdated}" /></td>
								</tr>
							</g:each>
						</tbody>
					</table>
					<div class="paginateButtons">
						<g:paginate next="다 음" prev="이 전" maxsteps="0" action="list"
							total="${reportInstanceCount}" params="${filterParams}" />
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>

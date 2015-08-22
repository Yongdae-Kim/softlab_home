<%@ page import="com.jejuuniv.softlab.home.Researcher"%>
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
					연구원 목록 <br> <br> <small>After completing the
						form, Click the 'Register' button</small>
				</h1>
			</div>
			<div class="row">
				<div class="col-md-10 col-md-offset-1">

					<g:form action="index" id="searchableForm" method="get"
						name="searchableForm">

						<div class="input-group">
							<input type="datetime" name="q" class="form-control"
								value="${params.q}" id="q" placeholder="검색을 원하는 입학년도를 입력하세요."> <span
								class="input-group-btn"> <input type="submit"
								class="btn btn-default" value="검색하기" /> <g:link
									action="downloadExcel" class="btn btn-default">Excel로 받기
								</g:link>
							</span>
						</div>
					</g:form>
					<br>
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<g:sortableColumn property="id" title="번 호" />
								<td>사 진</td>
								<td>이 름</td>
								<g:sortableColumn property="admissionNum" title="입학년도" />
								<td>연락처</td>
								<td>이메일</td>
							</tr>
						</thead>
						<tbody>
							<g:each in="${researcherInstanceList}" status="i"
								var="researcherInstance">
								<tr>
									<td>
										${fieldValue(bean: researcherInstance, field: "id")}
									</td>
									<td><g:if test="${researcherInstance?.uploadFile?.path}">
											<g:img dir="upload_folder/admin/researcher_list"
												file="${researcherInstance?.uploadFile?.name}" width="100"
												height="100" />
										</g:if> <g:else>이미지 없음</g:else></td>
									<td><g:link action="show" id="${researcherInstance.id}">
											${fieldValue(bean: researcherInstance, field: "name")}
										</g:link></td>
									<td>
										${fieldValue(bean: researcherInstance, field: "admissionNum")}
									</td>
									<td>
										${fieldValue(bean: researcherInstance, field: "phoneNum")}
									</td>
									<td>
										${fieldValue(bean: researcherInstance, field: "email")}
									</td>
								</tr>
							</g:each>
						</tbody>
					</table>
					<div class="paginateButtons">
						<g:paginate next="다 음" prev="이 전" maxsteps="0" action="index"
							total="${researcherInstanceCount}" />
					</div>
					<g:link class="btn btn-skin pull-right btn-lg" action="create">연구원 등록하기</g:link>

				</div>
			</div>
		</div>
	</section>
</body>
</html>

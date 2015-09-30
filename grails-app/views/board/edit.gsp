<%@ page import="com.jejuuniv.softlab.home.Subject"%>

<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />

</head>
<body onload=''>
	<section id="intro" class="home-section">
		<div class="container">
			<div class="page-header">
				<h1>
					게시글 수정하기 <br> <small>After completing the form, Click
						the 'Register' button</small>
				</h1>
			</div>
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<g:uploadForm action="update" method="POST">
						<g:hiddenField name="id" value="${boardInstance?.id}" />
						<g:hiddenField name="version" value="${boardInstance?.version}" />
						<div class="well well-sm">
							<strong><span class="glyphicon glyphicon-asterisk"></span>
								필 수 입 력</strong>
						</div>
						<fieldset class="form">
							<%-- #################### _form 템플릿 #################### --%>
							<g:render template="/board/form" />
							<%-- ###################################################### --%>
						</fieldset>
						<fieldset class="buttons">
							<div class="form-group">
								<g:submitButton name="update"
									class="btn btn-skin pull-right btn-lg btn-block"
									value="수 정 하 기" />
							</div>
						</fieldset>
					</g:uploadForm>
				</div>
			</div>
		</div>
	</section>
</body>
</html>


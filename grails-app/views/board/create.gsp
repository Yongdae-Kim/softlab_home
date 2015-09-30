<%@ page import="com.jejuuniv.softlab.home.Subject"%>
<%@ page import="com.jejuuniv.softlab.home.JavaReport"%>

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
					게시글 제출하기 <br> <small>After completing the form, Click
						the 'Register' button</small>
				</h1>
			</div>
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<g:uploadForm action="save" method="POST">
						<fieldset class="form">
							<div class="well well-sm">
								<strong><span class="glyphicon glyphicon-asterisk"></span>
									필 수 입 력</strong>
							</div>
							<%-- #################### _form 템플릿 #################### --%>
							<g:render template="/board/form" />
							<%-- ###################################################### --%>
							<div class="form-group">
								<label for="captcha">체크박스를 선택해주세요.</label>
								<recaptcha:ifEnabled>
									<recaptcha:recaptcha theme="dark" />
								</recaptcha:ifEnabled>
							</div>
						</fieldset>
						<fieldset class="buttons">
							<div class="form-group">
								<g:submitButton name="create"
									class="btn btn-skin pull-right btn-lg btn-block" value="제 출 하 기" />
							</div>
						</fieldset>
					</g:uploadForm>
				</div>
			</div>
		</div>
	</section>
</body>
</html>


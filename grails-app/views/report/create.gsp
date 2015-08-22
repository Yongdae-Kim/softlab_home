<%@ page import="com.jejuuniv.softlab.home.Subject"%>
<%@ page import="com.jejuuniv.softlab.home.JavaReport"%>

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
					레포트 제출하기
					<g:link class="btn btn-skin btn-lg" action="index">게시판 목록 보기</g:link>
					<br> <br> <small>각 항목을 입력하고, '제출하기' 버튼을 눌러주세요.</small>
				</h1>
			</div>
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<g:uploadForm action="save" method="POST">
						<div class="well well-sm">
							<strong><span class="glyphicon glyphicon-asterisk"></span>
								필 수 입 력</strong>
						</div>
						<%-- #################### _form 템플릿 #################### --%>
						<g:render template="/report/form" />
						<%-- ###################################################### --%>
						<div class="form-group">
							<label for="captcha">체크박스를 선택해주세요.</label>
							<recaptcha:ifEnabled>
								<recaptcha:recaptcha theme="dark" />
							</recaptcha:ifEnabled>
						</div>
						<div class="form-group">
							<g:submitButton name="create"
								class="btn btn-skin btn-lg btn-block" value="제 출 하 기" />
						</div>
					</g:uploadForm>
				</div>
			</div>
		</div>
	</section>
</body>
</html>


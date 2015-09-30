<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">

<head>

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<meta name="description" content="softlab homepage project" />
<meta name="author" content="teach.d" />

<title>소프트웨어 개발 연구실(SoftLab)</title>

<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'bootstrap.min.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'font-awesome/css', file: 'font-awesome.min.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'animate.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}"
	type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'color.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'paginate.css')}" type="text/css">


<g:javascript library='jquery' plugin="jquery" />
<g:javascript library='bootstrap.min' />
<g:javascript library='jquery.easing.min' />
<g:javascript library='jquery.scrollTo' />
<g:javascript library='wow.min' />
<g:javascript library='custom' />
<g:javascript library='img_preview' />


<g:layoutHead />

</head>
<body>

	<%-- #################### _form 템플릿 #################### --%>
	<g:render template="/navi" />
	<%-- ###################################################### --%>

	<g:layoutBody />

	<%-- #################### _form 템플릿 #################### --%>
	<g:render template="/footer" />
	<%-- ###################################################### --%>

</body>
</html>

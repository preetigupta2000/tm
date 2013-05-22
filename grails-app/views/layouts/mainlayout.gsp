<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>Fonantrix Solutions</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0; maximum-scale=1.0;">
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'less/index.css')}" type="text/css">
		<g:javascript src="lesscompiler/less-1.3.1.min.js"></g:javascript>
		<g:javascript src="jquery-1.7.2.min.js"></g:javascript>
		<g:javascript src="bootstrap-dropdown.js"></g:javascript>
		<g:javascript src="bootstrap-collapse.js"></g:javascript>
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		<div id="wrapper" class="clearfix">
			<g:render template="/header"/>
			
			<g:layoutBody/>
			
			<g:render template="/footer"/>
		</div> <!-- /wrapper -->
	  <div id="spinner" class="spinner" style="display:none;">
	    <img src="${createLinkTo(dir:'images',file:'spinner.gif')}" alt="Spinner" />
	  </div> 		
		<r:layoutResources />
	</body>
</html>
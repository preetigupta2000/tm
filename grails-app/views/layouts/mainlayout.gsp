<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>Time Management</title>

        <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;">
		<meta name="apple-mobile-web-app-capable" content="yes" />
		
		<meta name="description" content="Fonantrix, 2013">
		<meta name="author" content="Fonantrix Solutions LLP.">
	
		<fon:stylesheet src="index"/>
		
		<r:require modules="corejs"/>
						
		<g:layoutHead/>
		<r:layoutResources/>
	</head>
	<body>
		<div id="wrapper" class="clearfix">
			<g:render template="/templates/header"/>		
			<g:layoutBody/>	
			<g:render template="/templates/footer"/>		
		</div> <!-- /wrapper -->
	  <div id="spinner" class="spinner" style="display:none;">
	    <img src="${createLinkTo(dir:'images',file:'spinner.gif')}" alt="Spinner" />
	  </div> 		
		<r:layoutResources/>
	</body>
</html>
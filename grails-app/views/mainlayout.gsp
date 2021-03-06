<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
		<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>Time Management</title>

        <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;">
		<meta name="apple-mobile-web-app-capable" content="yes" />
		
		<meta name="description" content="Fonantrix, 2013">
		<meta name="author" content="Fonantrix Solutions LLP.">
	
		<fon:stylesheet src="index"/>
		<!-- Added Admin review status   -->
		<r:require modules="corejs"/>
		<!-- Added for User DashBoard Support  -->
		<r:require modules="calendarjs"/>	
		<!-- Added for Hr review status chart  -->
		<r:require modules="hrchartsjs"/>
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
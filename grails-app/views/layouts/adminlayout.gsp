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
		
		<r:require modules="indexjs"/>
		
		<g:set var="contextPath" value="${request.contextPath}"/>
		<r:script type="text/javascript" disposition="head">
			var com = {
				 fonantrix : {
					tm : {
						REQUEST_CONTEXT : "${request.contextPath}"
					}
				}
			}			
		</r:script>		
						
		<g:layoutHead/>
		<r:layoutResources/>
	</head>
	<body>
		<g:include view="layout-helpers/modals.gsp"/>
		<g:include view="layout-helpers/facebook_init.gsp"/>
		<div id="wrapper" class="clearfix">
			<g:include view="layout-helpers/header.gsp"/>		
			<g:layoutBody/>	
			<g:include view="layout-helpers/footer.gsp"/>	
		</div> <!-- /wrapper -->
	  <div id="spinner" class="spinner" style="display:none;">
	    <img src="${createLinkTo(dir:'images',file:'spinner.gif')}" alt="Spinner" />
	  </div> 		
		<r:layoutResources/>
	</body>
</html>
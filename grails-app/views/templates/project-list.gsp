<g:set var="contextPath" value="${request.contextPath}"/>
<div class="row" id="header">
	<div class="col-md-12">
		<div class="headerband">				
			<span id="headingtext">
				<a href="${contextPath}/home">
					<div class="circle pull-left">
						<i class="fa fa-home"></i>
					</div>
				</a>
				<span class="line-right"></span>
				{{#if clientid}}
					<a href="#/client/list">Manage Client</a><span class="line-right"></span>
				{{/if}}							
 					Manage Projects
			</span>
			<span class="pull-right">
				<a href="#" onclick="window.history.back();">Return</a>
				<a id="addNewProject" role="button" class="btn btn-default btn-sm navigationbutton overlay-modal" data-response-type="json" href="${contextPath}/api/client" data-auto-size="false" data-template-url="add-project" data-height="400px" data-max-width="550px">
					<i class="fa fa-plus"></i>  Add New Project
				</a>
			</span>
		</div>			
	</div>
</div>
{{#if clientid}}
	<div class="row">
		<div class="col-md-12">
			<div class="well">
				Client Id : {{clientid}}
			</div>
		</div>
	</div>
{{/if}}
<div class="row">
	<div class="col-md-12">
		<!-- changes made by sunil -->	
		<table class="table table-striped" id="no-more-tables">
			<tbody id="project-list">
			</tbody>
		</table>		
	</div>			
</div>
<%@ page contentType="text/html;charset=ISO-8859-1" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
		<meta name="layout" content="mainlayout"/>
		<title>Insert title here</title>
		<style type="text/css">
		@media only screen and (max-width: 800px) {
		/* Force table to not be like tables anymore */
		#no-more-tables table,
		#no-more-tables thead,
		#no-more-tables tbody,
		#no-more-tables th,
		#no-more-tables td,
		#no-more-tables tr {
		display: block;
		}
		 
		/* Hide table headers (but not display: none;, for accessibility) */
		#no-more-tables thead tr {
		position: absolute;
		top: -9999px;
		left: -9999px;
		}
		 
		#no-more-tables tr { border: 1px solid #ccc; }
		 
		#no-more-tables td {
		/* Behave like a "row" */
		border: none;
		border-bottom: 1px solid #eee;
		position: relative;
		padding-left: 50%;
		white-space: normal;
		text-align:left;
		}
		 
		#no-more-tables td:before {
		/* Now like a table header */
		position: absolute;
		/* Top/left values mimic padding */
		top: 6px;
		left: 6px;
		width: 45%;
		padding-right: 10px;
		white-space: nowrap;
		text-align:left;
		font-weight: bold;
		}
		 
		/*
		Label the data
		*/
		#no-more-tables td:before { content: attr(data-title); }
		}
		i
		{
			cursor: pointer;
		}
		</style>
		<script type="text/javascript">
		
		$(document).ready(function () {
			$(".add-project").click(function() {
				var currentClientId = $(this).attr("id");
				$(".modal-add-button-hidden").attr("value",currentClientId);
			});
		});
		function setClientId(object)
		{
			$('input[name=editClientId]').val($(object).attr('id'));
		}
		</script>
	</head>
	<body>
		<div class="container">
			<div class="row-fluid">
		  		<div class="span12">
		  			<button class="btn btn-small btn-primary" type="button" data-toggle="modal" href="#addClientModal">Add Client</button>
		  		</div>
		  	</div>
			<div class="row-fluid">
			  	<table id="no-more-tables" class="table table-striped table-hover table-bordered table-condensed">
			  		<thead>
			  			<tr>
			  				<th class="span2">Client Id</th>
			  				<th class="span3">Client</th>
			  				<th class="span5">Description</th>
			  				<th class="span2">Options</th>
			  			</tr>
			  		</thead>
			  		<tbody>
						<g:each in="${client}" status="i" var="Client">
				  			<tr>
				  				<td data-title="Client Id">${fieldValue(bean:Client, field:'id')}</td>
				  				<td data-title="Name">${fieldValue(bean:Client, field:'name')}</td>
				  				<td data-title="Description">${fieldValue(bean:Client, field:'description')}</td>
				  				<td data-title="Option"><g:link id="${fieldValue(bean:Client, field:'id')}" controller="client" action="editClient" params='[clientId:"${fieldValue(bean:Client, field:'id')}"]'><i class="icon-pencil" title="Edit"></i></g:link> | <g:link id="${fieldValue(bean:Client, field:'id')}" class="confirm-delete" controller="Client" action="deleteClient" data-confirm="Are you sure you want to delete?"><i class="icon-remove" title="Delete"></i></g:link>
				  				<button id="${fieldValue(bean:Client, field:'id')}" class="btn btn-mini btn-primary add-project" type="button" data-toggle="modal" href="#addProjectModal">Add Project</button>
				  				<g:link params='[clientId:"${fieldValue(bean:Client, field:'id')}"]' class="badge badge-info" controller="project" action="viewprojects">View Projects</g:link>
				  				<g:hiddenField name="clientId" value="${fieldValue(bean:Client, field:'id')}"></g:hiddenField>
				  				</td>
				  			</tr>
				  		</g:each>
			  		</tbody>
			  	</table>
		  	</div>
		</div>
		<!-- Modal -->
		<div id="addClientModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<g:form controller="Client" action="addclient">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h3 id="myModalLabel">Add New Client Information</h3>
				</div>
				<div class="modal-body">
					<div class="control-group">
			          <!-- Text input-->
			          <label class="control-label" for="input01">Client Name</label>
			          <div class="controls">
			            <g:textField  name="name" placeholder="Please enter the Client name" class="input-xlarge" value="${form?.name}"></g:textField>
			          </div>
			        </div>
			    	<div class="control-group">
			          <!-- Text input-->
			          <label class="control-label" for="input01">Client Description</label>
			          <div class="controls">
			            <g:textField  name="description" placeholder="Please enter the Client Description" class="input-xlarge" value="${form?.description}"></g:textField>
			           </div>
			        </div>
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
					<button class="btn btn-primary">Add</button>
				</div>
			</g:form>
		</div>
		<div id="addProjectModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<g:form controller="Client" action="addproject">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h3 id="myModalLabel">Add New Project Information</h3>
				</div>
				<div class="modal-body">
					<div class="control-group">
			          <!-- Text input-->
			          <label class="control-label" for="input01">Project Name</label>
			          <div class="controls">
			            <g:textField  name="name" placeholder="Please enter the Client name" class="input-xlarge" value="${form?.name}"></g:textField>
			          </div>
			        </div>
			    	<div class="control-group">
			          <!-- Text input-->
			          <label class="control-label" for="input01">Project Description</label>
			          <div class="controls">
			            <g:textField  name="description" placeholder="Please enter the Client Description" class="input-xlarge" value="${form?.description}"></g:textField>
			           </div>
			        </div>
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
					<button class="btn btn-primary">Add</button>
					<g:hiddenField class="modal-add-button-hidden" name="modalHidden" value=""/>
				</div>
			</g:form>
		</div>
	</body>
</html>
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
 					Manage Clients
			</span>
			<span class="pull-right">
				<a href="#" onclick="window.history.back();">Return</a>
				<a id="addNewClient" role="button" class="btn btn-default btn-sm navigationbutton overlay-modal"  data-is-template="true" data-auto-size="false" data-template-url="add-client" data-height="330px" data-max-width="550px">
					<i class="fa fa-plus"></i>  Add New Client
				</a>
			</span>
		</div>			
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<!-- changes made by sunil -->	
		<table class="table table-striped" id="no-more-tables">
			<tbody id="client-list">
			</tbody>
		</table>		
	</div>			
</div>
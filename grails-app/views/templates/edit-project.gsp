<!-- Modal Client -->
	<form id="projectform" class="form-horizontal" method="post" name="projectform" action="#">
		<div class="modal-header">
			<h3 id="myModalLabel">Edit Project Information ({{id}}) - Client Id: {{clientname}}</h3>
		</div>
		<div class="modal-body">
			<div class="form-group">
	          <!-- Text input-->     
	          <label class="control-label" for="input01">Project Name</label>
	          <div class="controls">
	          	<input id="name" placeholder="Project name" name="name" class="input" value="{{name}}" required/>
				<span class="alert alert-danger hide" id="error-name">
					<strong>Warning!</strong> Project name is not correct.
				</span>	          	
	          </div>
	        </div>
	    	<div class="form-group">
	          <!-- Text input-->
	          <label class="control-label" for="input01">Project Description</label>
	          <div class="controls">
	            <textarea id="description" name="description" placeholder="Please enter the Project Description" rows="2">{{description}}</textarea>
				<span class="alert alert-danger hide" id="error-description">
					<strong>Warning!</strong> Project description is not correct.
				</span>	            
	           </div>
	        </div>
		</div>
		<div class="modal-footer">
			<a class="btn btn-default" title="Close"><i class="fa fa-times"></i> Close</a>
			<a class="btn btn-default navigationbutton" client-id="{{clientid}}" project-id="{{id}}" id="edit"><i class="fa fa-save"></i> Save</a>
		</div>
	</form>
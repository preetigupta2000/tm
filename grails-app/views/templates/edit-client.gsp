<!-- Modal Client -->
	<form id="clientform" class="form-horizontal" method="post" name="clientform" action="#">
		<div class="modal-header">
			<h3 id="myModalLabel">Edit Client Information ({{id}})</h3>
		</div>
		<div class="modal-body">
			<div class="form-group">
	          <!-- Text input-->     
	          <label class="control-label" for="input01">Client Name</label>
	          <div class="controls">
	          	<input id="name" placeholder="Client name" name="name" class="input" value="{{name}}" required/>
				<span class="alert alert-danger hide" id="error-name">
					<strong>Warning!</strong> Client name is not correct.
				</span>	          	
	          </div>
	        </div>
	    	<div class="form-group">
	          <!-- Text input-->
	          <label class="control-label" for="input01">Client Description</label>
	          <div class="controls">
	            <textarea id="description" name="description" placeholder="Please enter the Client Description" rows="2">{{description}}</textarea>
				<span class="alert alert-danger hide" id="error-description">
					<strong>Warning!</strong> Client description is not correct.
				</span>	            
	           </div>
	        </div>
		</div>
		<div class="modal-footer">
			<a class="btn btn-default" title="Close"><i class="fa fa-times"></i> Close</a>
			<a class="btn btn-default navigationbutton" client-id="{{id}}" id="edit"><i class="fa fa-save"></i> Save</a>
		</div>
	</form>		

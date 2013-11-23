<form id="deleteClient" class="form-horizontal" method="post" name="deleteClient" action="#">
	<div class="modal-header">
		<h3 id="myModalLabel">Edit Client Information ({{id}})</h3>
	</div>
	<div class="modal-body">
		<div class="form-group">
          <!-- Text input-->     
          <label class="control-label" for="input01">Client Name</label>
          <div class="controls">
          	<input id="name" placeholder="Client name" name="name" class="input" value="{{name}}" disabled/>
          </div>
        </div>
    	<div class="form-group">
          <!-- Text input-->
          <label class="control-label" for="input01">Client Description</label>
          <div class="controls">
            <textarea id="description" name="description" placeholder="Please enter the Client Description" rows="2" disabled=true>{{description}}</textarea>           
           </div>
        </div>
	</div>
	<div class="modal-footer">
		<a class="btn btn-default" title="Close"><i class="fa fa-times"></i> Close</a>
		<a class="btn btn-default navigationbutton" type="button" client-id="{{id}}" id="delete"><i class="fa fa-times"></i> Delete</a>
	</div>
</form>
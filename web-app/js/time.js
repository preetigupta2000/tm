jQuery(document).ready(function(){

	jQuery('body').css('overflow-x','hidden');
	jQuery('#tr1').css('background-color','lightyellow');
	jQuery('.th1').css('background-color','lightyellow');
	
	
	
	
	
			loadCal();
});
function loadCal()
{
	jQuery('#no-more-tables td').click(function(){
	var tdcell = jQuery(this).attr('id');
	jQuery('#temp').val(tdcell);
	
var $dialogContent=jQuery("#myModal");
 $dialogContent.css('width',259);
$dialogContent.modal('show');
jQuery("#myModal").modal({
             autoOpen: false,
             modal: true,
			keyboard:false,
	         backdrop:'static',
     
         });
  		});


	
}
function saveValue()
{
	var hours=jQuery('#expectedtime').val();
	         if(hours>0)
				{		
					var tdClass=jQuery('#temp').val();
					var idPrefix=tdClass.substring('0','1');
					var idPostfix=tdClass.substring('1','2');
					var i=parseInt(idPostfix, 10)+parseInt(hours, 10)-1;
					jQuery('#colorvalue').val(i);
				}		
}

function showtime(tabid , coltd )
	{
		var color = coltd;
		if(color>0)
		{		
			var idPrefix=tabtd.substring('0','1');
			var idPostfix=tabtd.substring('1','2');
			var i=parseInt(idPostfix, 10)+parseInt(color, 10)-1;
			for(var index = i ; index <= 10 ; index++)
			{
				jQuery('td[id^='+idPrefix+index+']').css('background-color','white');
			}
			for(var index = 0 ; index < color ; index++)
				{
				jQuery('td[id='+idPrefix+idPostfix+']').css('background-color','#660066');
					idPostfix++;
				}
		}		
	}

function taskHrs()
{

	
	var test =  $("#task option:selected").text();
	var project=$("#project option:selected").text();
	
	
	
	var list =jQuery("#taskhrs").text();
	 var taskHrsList=$.parseJSON(list);
	  var estimatedHrs
	
		
	  var flag=false;
  
				  	for(j=0;j<taskHrsList.ProjectTaskEstimatedHrs.length;j++)
				   	{
				  		
				  		
			      
					   currentTask = taskHrsList.ProjectTaskEstimatedHrs[j];
					   estimatedHrs=currentTask.estimatedHrs;
					 
				  
					   if(test.indexOf(currentTask.taskName)==0 )
					   {
						   
						
						   $('.estimatedHrs').val(currentTask.estimatedHrs); //Set values dynamically
						
					
					
					      }
					  
				    	}
     
     
}
     
     
     
     function projectTask()
     {
     	
     
     	var project=$("#project option:selected").text();
   	 $('#task').empty();
   	 $('#task')
      .append($("<option></option>")
      .attr("value","select following task")
      .text("select following task")); 
     	
     	var list =jQuery("#taskhrs").text();
     	 var taskHrsList=$.parseJSON(list);
     	  var estimatedHrs
     	
     		
     	  var flag=false;
        
     				  	for(j=0;j<taskHrsList.ProjectTaskEstimatedHrs.length;j++)
     				   	{
     				  	
     			      
     					   currentTask = taskHrsList.ProjectTaskEstimatedHrs[j];
     					   estimatedHrs=currentTask.estimatedHrs;
     					   
     					
     					   
     				
     					   if(project.indexOf(currentTask.projectName)==0)
     					   {
     						   
     						
     						     $('#task')
     						         .append($("<option></option>")
     						         .attr("value",currentTask.taskName)
     						         .text(currentTask.taskName)); 
     						
     					
     						 
     					      }
     					   
     				
     					  
     				    	}
          
     }

	




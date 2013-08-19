

var piechart=[];
jQuery(document).ready(function () {
	

	
	var list =jQuery("#hidden").text();
	var totalTask =jQuery("#hiddenTask").text();
	var hiddenTimeEntry=jQuery("#hiddenTimeEntry").text();

	var uservalues = $('#user').text();

	var projectArray = [];
	
	var taskArray = [];
	var estimatedHrs= [];
	var actualHrs = []; 
	var opentask= [];
	var InProgressTask= [];
	var completedTask= [];
	
	
	var projectObj=$.parseJSON(list);
	var task=$.parseJSON(totalTask);
    var usertimeEntry=$.parseJSON(hiddenTimeEntry);

 for(i=0;i<projectObj.totalproject.length;i++)
	{

	 
	 var openCount=0;
		var InProgCount=0
		var comCount=0;
		currentProject = projectObj.totalproject[i];
		for(j=0;j<task.totalTask.length;j++) 
 			{
 			currentTask = task.totalTask[j];
 		
 			
 	   if(currentProject.projectId==currentTask.taskCumProjectId)
 		{
  		
 	
 			if(currentTask.status=="Open")
			{
 			
			openCount++;
			
			}
	
 			if(currentTask.status=="InProgress")
 			{
			InProgCount++;
		
 				}
	
 			if(currentTask.status=="Completed")
 			{  
			comCount++;
	
 			}
 			
 			
 			}
 	
 		}
		//pushing the values after total count
		opentask.push(openCount);
		 InProgressTask.push(InProgCount);
		completedTask.push(comCount);
		projectArray.push(currentProject.name);
	}
		
 

 

 
 //Dynamic data for bar chart between actual and estimated chart
 for(j=0;j<usertimeEntry.timeEntryDetail.length;j++)
	{
	currentTask = usertimeEntry.timeEntryDetail[j];
	taskArray.push(currentTask.taskName);
		actualHrs.push(currentTask.actualHrs);
		estimatedHrs.push(currentTask.estimatedhrs);
	}
 
 
 

	$(function () {

   var yAxisLabels = [0, 1, 2, 3, 4,5, 6,7];
   var colWidth = ($('#container').width() / projectArray.length) + 1;
   jQuery('#container').highcharts({
            chart: {
                type: 'column'
            },
            
            exporting: {
                buttons: {
                    contextButtons: {
                        enabled: false,
                        menuItems: null
                    }
                },
                enabled: false
            },
            title: {
                text: 'Project Task chart'
            },
            
            xAxis: {
			title: {
                    text: 'Projects'
                },	
                categories: projectArray
            },
            yAxis: { 
            	
				title: {
                    text: 'Tasks'
                },			
      
                tickPositioner: function() {
                    return yAxisLabels;
                }
    },
                stackLabels: {
                   
                    style: {
                        fontWeight: 'bold',
                        color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                    }
                },
            
                legend: {
                	   layout: 'vertical',
                    align: 'right',
                    x: -100,
                    verticalAlign: 'top',
                    y: 20,
                    floating: true,
                    backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColorSolid) || 'white',
                    borderColor: '#CCC',
                    borderWidth: 1,
                    shadow: false
                },
            tooltip: {
                formatter: function() {
                    return '<b>'+ this.x +'</b><br/>'+
                        this.series.name +': '+ this.y +'<br/>'+
                        'Total Task: '+ this.point.stackTotal;
                },
                align: 'center'  
            },
            plotOptions: {
                column: {
                    stacking: 'normal',
                   
                    pointWidth: 50,
                    dataLabels: {
                        enabled: false,
                        color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
                    },
                  
                }
            },
            series: [{
                name: 'Completed Task',
                data: completedTask,
             
            }, {
                name: 'In progress Task',
                data: InProgressTask,
              
            }, {
                name: 'Open Task',
                data: opentask,
           
            }]
        });
    });
	
	
	
	
	//for vertical bar charts
	var list =jQuery("#hidden").text()
	 var totalTask =jQuery("#hiddenTask").text();
	
	 var clientProjectTaskList=$.parseJSON(totalTask);
	 var projects=$.parseJSON(list)
	 var selectedClientName=  $("#client option:selected").text();
	 var selectedProject=  $("#clientProject option:selected").text();
	 var clientArray=[];
	 var  taskArray=[];
	  var projectArr=[];
	
	 
	 
	 
	 
	  

	 for(i=0;i<projects.totalproject.length;i++)
		{

		 
		 		var taskCount=0;
		 		currentProject = projects.totalproject[i];
		 		for(j=0;j<clientProjectTaskList.totalTask.length;j++)
	 			{
		 			currentTask = clientProjectTaskList.totalTask[j];
	 		
	 				if(selectedClientName.indexOf(currentTask.clientName)== 0 )
	 				{
	 					
	 					if(currentProject.projectId==currentTask.taskCumProjectId)
	 					{
	 		
	 						taskCount++;
	 					
	 					}
	 					
	 					
	 					
	 					//pushing the values after total count
	 					
	 				}
	 				  
	 			}
		 		
		 	
		 		if(selectedClientName.indexOf(currentProject.clientName)==0)
		 			{
		 		
		 			projectArr.push({ name:currentProject.name , data:[taskCount] });
		 			
		 			}
		 		
		 		
		 
		 	
	 
	 }
	 
	
	 clientArray.push(selectedClientName);
	



			
	
	$(function () {
		
		
		var yAxisLabels = [0, 1, 2, 3, 4, 5];
        $('#verticalBarContainer').highcharts({
            chart: {
                type: 'column'
            },
            
            //To hide context-menu
            exporting: {
                buttons: {
                    contextButtons: {
                        enabled: false,
                        menuItems: null
                    }
                },
                enabled: false
            },
            title: {
                text: 'Clients projects chart'
            },
           
            xAxis: {
                categories: clientArray
            },
            yAxis: { 
            	
	        	title: {
                    text: 'No of tasks'
                },	
                tickPositioner: function() {
                    return  yAxisLabels;
                }
    },
    

    legend: {
    	   layout: 'vertical',
        
        align: 'right',
        x: -100,
        verticalAlign: 'top',
        y: 20,
        floating: true,
        backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColorSolid) || 'white',
        borderColor: '#CCC',
        borderWidth: 1,
        shadow: false
    },
            tooltip: {
            	  enabled: false,
            },
            plotOptions: {
                column: {
                	  pointWidth: 50,
                  //  pointPadding: 0.2,
                    borderWidth: 0
                }
            },
            series: projectArr
            
            
        });
    });
	
	
	

	 
	
	//Bar chart
	$(function () {
		
		var yAxisLabels = [0, 1, 2, 3, 4, 5];
		 var chart = 'bar'
			 
			   // $("select").change(function(){
			        //chart = $('#chart').val();
			       // alert(chart);
			    var chart1 = new Highcharts.Chart({
			        chart: {
			            renderTo: 'stackBarContainer',
			            type: chart

			        },
			        
			        exporting: {
		                buttons: {
		                    contextButtons: {
		                        enabled: false,
		                        menuItems: null
		                    }
		                },
		                enabled: false
		            },
			        title: {
			            text: 'Task Hrs chart'
			        },
			        xAxis: {
			        	 categories: taskArray,
						title: {
			                text: 'Tasks'
			            }
			        },
			        
			        yAxis: { 
		            	
			        	title: {
		                    text: 'Hrs'
		                },	
		                tickPositioner: function() {
		                    return yAxisLabels;
		                }
		    },
		    
		    legend: {
		        align: 'right',
		        x: -100,
		        verticalAlign: 'top',
		        y: 20,
		        floating: true,
		        backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColorSolid) || 'white',
		        borderColor: '#CCC',
		        borderWidth: 1,
		        shadow: false
		    },
			        series: [{
			            name: 'Actual Hrs',
			            data: actualHrs
			        }, {
			            name: 'Estimated Hrs',
			            data: estimatedHrs
			        }]
			    });
			});


	
	

	
	 
	 
	var piechart=[];
	
	var username;
	var estimatedHrsVal=0;
	 var totalWorkingHrs;
	 var available;
	 
	 var selectedValue =  $("#user option:selected").text();
	 
	 for(j=0;j<usertimeEntry.timeEntryDetail.length;j++)
		{
		 
		currentTask = usertimeEntry.timeEntryDetail[j];
		
			username=currentTask.userName;
			
			//new start
			if(selectedValue.indexOf(username)==0)
			{
				estimatedHrsVal=currentTask.estimatedhrs+estimatedHrsVal;
	           totalWorkingHrs=8;
			 
			}
			
		}
	 
	 			
	 		  if(estimatedHrsVal>8)
	 			  {
	 			 piechart.push(["Available", 100]);
	 			  }
	 		  else
	 		  {
	 			 percentage =  estimatedHrsVal / totalWorkingHrs * 100;
				 available=100- percentage;
				 
				 piechart.push(["Occupied", percentage]);
				 piechart.push(["Available", available]); 
	 			  
	 		  }
			
			//new end
		
			//  piechart.push([currentTask.name, 25]); //old 


	
	
	$(function() {
		   $("#user").change(function(){
		 //   var $uid= $("#update")
		      //$uid.html("This is " + $("#choose").val() + " and other info");
			
				var test =  $("#user option:selected").text();
				
				
				
				 
			  var flag=false;
			
			  	for(j=0;j<usertimeEntry.timeEntryDetail.length;j++)
			   	{
		 
				   currentTask = usertimeEntry.timeEntryDetail[j];
				   username=currentTask.userName;
			
			  
				   if(test.indexOf(username)==0)
				   {
					   flag=true;
					  
					   	if(flag==true)
					   		{
					   		pieFunction();
					   		break;
					   		}
				
			
			
				   }
				   else
				   {
					  flag=false; 
				
				   }
			  
			}
		   });
		});
	
	
	
	
	
	$(function() {
		   $("#duration").change(function(){
		
				var selectedDuration =  $("#duration option:selected").text();
					
				 		
		  
				   if(selectedDuration.indexOf("Day")==0)
				   {
					  
					   pieFunction();
				
			
				   }
				   else if(selectedDuration.indexOf("Week")==0)
				   	{
			       pieFunction();
				   	}
			    
	
		   });
		});
	


	
	$(function () {
	    	// Build the chart
	        $('#pieChartContainer').highcharts({
	            chart: {
	                plotBackgroundColor: null,
	                plotBorderWidth: null,
	                plotShadow: false
	            },
	            //To hide context-menu
	            exporting: {
	                buttons: {
	                    contextButtons: {
	                        enabled: false,
	                        menuItems: null
	                    }
	                },
	                enabled: false
	            },
	            title: {
	                text: 'User BandWidth'
	            },
	            tooltip: {
	        	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	            },
	            plotOptions: {
	                pie: {
	                    allowPointSelect: true,
	                    cursor: 'pointer',
	                    dataLabels: {
	                        enabled: false
	                    },
	                    showInLegend: true
	                }      
	              
	            },
	            
	            legend: {
	                enabled: true,
	                layout: 'vertical',
	                align: 'left',
	               // width: 220,
	                verticalAlign: 'top',
					borderWidth: 0,
	                useHTML: true,
					
					
	            },
            
	            series: [{
	                type: 'pie',
	                name: 'BandWidth Percentage',
	                data: piechart
	            }]
	        });
	    
	});	
});
		
	

//pie chart

function pieFunction()
{

	var hiddenTimeEntry=jQuery("#hiddenTimeEntry").text();

		var piechart=[];
		var selecteduserName=  $("#user option:selected").text();
	  var selectedDuration=  $("#duration option:selected").text();
	
		var estimatedHrs=0;
		 var totalWorkingHrs;
		 var available;
		 var usertimeEntry=$.parseJSON(hiddenTimeEntry);

		for(j=0;j<usertimeEntry.timeEntryDetail.length;j++)
	   	{
 
		   currentTask = usertimeEntry.timeEntryDetail[j];
		   username=currentTask.userName;
	
	
			
		   if(selecteduserName.indexOf(username)== 0 && selectedDuration.indexOf("Day")==0)
		   {
			   
				var piechart=[];
		
			   estimatedHrs=currentTask.estimatedhrs+estimatedHrs;
		         totalWorkingHrs=8;
			  // piechart.push([currentTask.name, 25]);
			   
			   		if(estimatedHrs>8)
			   		{
			   			
			   		
			   			piechart.push(["Occupied", 100]);
			   		}
			   		else
			   		{
			   			
			   		
			   			percentage =  estimatedHrs / totalWorkingHrs * 100;
			   			available=100- percentage;
			   			
				 
			   			piechart.push(["Occupied", percentage]);
			   			piechart.push(["Available", available]); 
	 			  
			   		}
			   
		   }
		   
		   
		   
		   else if(selecteduserName.indexOf(username)== 0 && selectedDuration.indexOf("Week")==0)
		   {
				var piechart=[];
			//	alert("hello else")
			   estimatedHrs=currentTask.estimatedhrs+estimatedHrs;
		         totalWorkingHrs=40;
			
			   
			   		if(estimatedHrs>40)
			   		{
			   			piechart.push(["Occupied", 100]);
			   		}
			   		else
			   		{
			   			
			   			
			   			percentage =  estimatedHrs / totalWorkingHrs * 100;
			   			available=100- percentage;
				   
			   			piechart.push(["Occupied", percentage]);
			   			piechart.push(["Available", available]); 
	 			  
			   		}
			   
		   }
	   	}

    	// Build the chart
        $('#pieChartContainer').highcharts({
    	
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            //To hide context-menu
            exporting: {
                buttons: {
                    contextButtons: {
                        enabled: false,
                        menuItems: null
                    }
                },
                enabled: false
            },
            title: {
                text: 'User BandWidth'
            },
            tooltip: {
        	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }      
              
            },
            
            legend: {
                enabled: true,
                layout: 'vertical',
                align: 'right',
               // width: 220,
                verticalAlign: 'top',
				borderWidth: 0,
                useHTML: true,
				
				
            },
        
            series: [{
                type: 'pie',
                name: 'BandWidth Percentage',
                data: piechart
            }]
        });
   // });
    
}






  function clientProjectTask()
     {
     
     
     	var client=$("#client option:selected").text();
   	 $('#clientproject').empty();
   	 $('#clientproject')
      .append($("<option></option>")
      .attr("value","select following Projects")
      .text("select  project")); 
     	
 	var totalTask =jQuery("#hiddenTask").text();
     	 var clientProjectTaskList=$.parseJSON(totalTask);
     	  var projectTask
     	
     		
     	  var flag=false;
         // alert(list )
     	     // alert(taskHrsList.TaskEstimatedHrs.length)
     				  	for(j=0;j<clientProjectTaskList.totalTask.length;j++)
     				   	{
     				  		
     				  
     			      
     					   currentclient = clientProjectTaskList.totalTask[j];
     					 
     					   
     					    //alert("estimatedHrs " +estimatedHrs);
     					 // alert(currentTask.projectName)
     				  
     					   
     					//  $('#task').empty();
     					   if(client.indexOf(currentclient.clientName)==0)
     					   {
     						
     						// alert(currentTask.taskName)
     						 //$("#task").val(currentTask.taskName).prop('selected',true); //Set values dynamically
     						   
     						 /*    $('#clientproject')
     						         .append($("<option></option>")
     						         .attr("value", currentclient.projectName)
     						         .text(currentclient.projectName)); */
     						
     						//$('#task').append(new Option(currentTask.taskName, currentTask.taskName));
     						 
     						    flag=true;
								  
								   	if(flag==true)
								   		{
								   	 verticalBarChart();
								   		break;
								   		}
							
						
						
							   }
							   else
							   {
								  flag=false; 
							
							   }
     					  }
     					   
     				 
     					  
     				    	
          
     }

  
  
  
  
  function verticalBarChart()
  {
	  var list =jQuery("#hidden").text()
		 var totalTask =jQuery("#hiddenTask").text();
		
		 var clientProjectTaskList=$.parseJSON(totalTask);
		 var projects=$.parseJSON(list)
		 var selectedClientName=  $("#client option:selected").text();
		 var selectedProject=  $("#clientProject option:selected").text();
		 var clientArray=[];
		 var  taskArray=[];
		  var projectArr=[];
		// var taskCount=0;
			//var projectArray=[];
		 
		 
		 
		 
		  

		 for(i=0;i<projects.totalproject.length;i++)
			{

			 
			 		var taskCount=0;
			 		currentProject = projects.totalproject[i];
			 		for(j=0;j<clientProjectTaskList.totalTask.length;j++)
		 			{
			 			currentTask = clientProjectTaskList.totalTask[j];
		 		
		 				if(selectedClientName.indexOf(currentTask.clientName)== 0 )
		 				{
		 					
		 					if(currentProject.projectId==currentTask.taskCumProjectId)
		 					{
		 		
		 						taskCount++;
		 					
		 					}
		 					
		 					
		 					
		 					//pushing the values after total count
		 					
		 				}
		 				  
		 			}
			 		
			 		if(selectedClientName.indexOf(currentProject.clientName)==0)
			 			{
			 			projectArr.push({ name:currentProject.name , data:[taskCount] });
			 			
			 			}
			 		
			 		
			 
			 		
			 		//projectArr.push({ name:currentProject.name , data:[taskCount] });
					
		 
		 }
		 
		
		 clientArray.push(selectedClientName);
		
			var yAxisLabels = [0, 1, 2, 3, 4, 5];
	        $('#verticalBarContainer').highcharts({
	            chart: {
	                type: 'column'
	            },
	            
	            //To hide context-menu
	            exporting: {
	                buttons: {
	                    contextButtons: {
	                        enabled: false,
	                        menuItems: null
	                    }
	                },
	                enabled: false
	            },
	            title: {
	                text: 'Clients projects chart'
	            },
	           
	            xAxis: {
	                categories: clientArray
	            },
	            yAxis: { 
	            	
		        	title: {
	                    text: 'No of tasks'
	                },	
	                tickPositioner: function() {
	                    return  yAxisLabels;
	                }
	    },
	    

	    legend: {
	    	   layout: 'vertical',
	        align: 'right',
	        x: -100,
	        verticalAlign: 'top',
	        y: 20,
	        floating: true,
	        backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColorSolid) || 'white',
	        borderColor: '#CCC',
	        borderWidth: 1,
	        shadow: false
	    },
	            tooltip: {
	            	  enabled: false,
	            },
	            plotOptions: {
	                column: {
	                   // pointPadding: 0.2,
	                    pointWidth: 50,
	                    borderWidth: 0
	                }
	            },
	            series: projectArr
	            
	            
	        });
 }
  
  
  
  
  
  
		

		
    
	
	
		
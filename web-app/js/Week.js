jQuery(document).ready(function() {

	jQuery(".hiddenItems").hide();
	jQuery("#task").attr("disabled",true);
	var jsondata=jQuery("#hidden").text();
	var jsonlist=$.parseJSON(jsondata);
   var $calendar = $('#calendar');
   var id = 1;
   $calendar.weekCalendar({
      timeslotsPerHour : 2,
      allowCalEventOverlap : true,
      overlapEventsSeparate: true,
      firstDayOfWeek : 1,
      businessHours :{start: 9, end: 19, limitDisplay: true },
      daysToShow : 7,
      height : function($calendar) {
         return $(window).height() ;
      },
      eventRender : function(calEvent, $event) {
         if (calEvent.end.getTime() < new Date().getTime()) {
            $event.css("backgroundColor", "#68A1E5");
            $event.find(".wc-time").css({
               "backgroundColor" : "#999",
               "border" : "1px solid #888"
            });
         }
      },
      draggable : function(calEvent, $event) {
         return calEvent.readOnly != true;
      },
      resizable : function(calEvent, $event) {
         return calEvent.readOnly != true;
      },
      eventNew : function(calEvent, $event) {
         var $dialogContent = $("#event_edit_container");
         resetForm($dialogContent);
         var startField = $dialogContent.find("select[name='start']").val(calEvent.start);
         var endField = $dialogContent.find("select[name='end']").val(calEvent.end);
         var projectField = $dialogContent.find("select[name='project']");
         var taskField = $dialogContent.find("select[name='task']");
         var ActualHoursField = $dialogContent.find("input[name='hours']");
         var titleField = $dialogContent.find("input[name='title']");
         var userField = $("#user").val();
         var esHrsField = $dialogContent.find("input[name='estimatedHrs']");
      
        // var estimatedhrsField = $dialogContent.find("select[name='hours']");
        
         $dialogContent.dialog({
            modal: true,
            title: "New Calendar Event",
            width: "auto",
            close: function() {
               $dialogContent.dialog("destroy");
               $dialogContent.hide();
               $('#calendar').weekCalendar("removeUnsavedEvents");
            },
            buttons: {
               save : function() {
                  calEvent.id = id;
                  id++;
                  calEvent.title = titleField.val();
                  calEvent.starttime = new Date(startField.val());
                  calEvent.endtime = new Date(endField.val());
                  calEvent.project = projectField.val();
                  calEvent.task = taskField.val();
                  calEvent.actualHours = ActualHoursField.val();
                  calEvent.user = userField;
                  calEvent.estimatedHours = esHrsField.val();
                  var Data = new Array();
                  Data = calEvent;
                  $calendar.weekCalendar("removeUnsavedEvents");
                  $calendar.weekCalendar("updateEvent", calEvent);
                  $dialogContent.dialog("close");
                  $.ajax({
                		url:"/tm/usertimesave/save",
                		dataType: 'json',
                		type:'post',
                		data: Data
                	});
               },
               cancel : function() {
                  $dialogContent.dialog("close");
               }
            }
         }).show();

         $dialogContent.find(".date_holder").text($calendar.weekCalendar("formatDate", calEvent.start));
         setupStartAndEndTimeFields(startField, endField, calEvent, $calendar.weekCalendar("getTimeslotTimes", calEvent.start));

      },
      eventDrop : function(calEvent, $event) {
      },
      eventResize : function(calEvent, $event) {
      },
      eventClick : function(calEvent, $event) {

         if (calEvent.readOnly) {
            return;
         }

         var $dialogContent = $("#event_edit_container");
         resetForm($dialogContent);
         var startField = $dialogContent.find("select[name='start']").val(calEvent.start);
         var endField = $dialogContent.find("select[name='end']").val(calEvent.end);
         var projectField = $dialogContent.find("select[name='project']").val(calEvent.project);
         var taskField = $dialogContent.find("select[name='task']").val(calEvent.task);
         var ActualHoursField = $dialogContent.find("input[name='hours']");
         var titleField = $dialogContent.find("input[name='title']").val(calEvent.title);
         var userField = $("#user").val();
         var esHrsField = $dialogContent.find("input[name='estimatedHrs']");
         var evenTitle = titleField.val();
         var eventId = getEventIdFromTitle(evenTitle);
      
         $dialogContent.dialog({
            modal: true,
            title: "Edit - " + calEvent.title,
            close: function() {
               $dialogContent.dialog("destroy");
               $dialogContent.hide();
               $('#calendar').weekCalendar("removeUnsavedEvents");
            },
            buttons: {
               save : function() {
            	   calEvent.id = eventId;
                   calEvent.title = titleField.val();
                   calEvent.starttime = new Date(startField.val());
                   calEvent.endtime = new Date(endField.val());
                   calEvent.project = projectField.val();
                   calEvent.task = taskField.val();
                   calEvent.actualHours = ActualHoursField.val();
                   calEvent.user = userField;
                   calEvent.estimatedHours = esHrsField.val();
                   var Data = new Array();
                   Data = calEvent;
                  $calendar.weekCalendar("updateEvent", calEvent);
                  $dialogContent.dialog("close");
                  $.ajax({
              		url:"/tm/usertimeupadte/update",
              		dataType: 'array',
              		type:'post',
              		data: Data
              	});
               },
               "delete" : function() {
            	   calEvent.id = eventId;
                  $calendar.weekCalendar("removeEvent", calEvent.id);
                  var Data = new Array();
                  Data = calEvent;
                  $.ajax({
                		url:"/tm/usertimedelete/delete",
                		dataType: 'array',
                		type:'post',
                		data: Data
                	});
                  $dialogContent.dialog("close");
               },
               cancel : function() {
                  $dialogContent.dialog("close");
               }
            }
         }).show();

         var startField = $dialogContent.find("select[name='start']").val(calEvent.start);
         var endField = $dialogContent.find("select[name='end']").val(calEvent.end);
         $dialogContent.find(".date_holder").text($calendar.weekCalendar("formatDate", calEvent.start));
         setupStartAndEndTimeFields(startField, endField, calEvent, $calendar.weekCalendar("getTimeslotTimes", calEvent.start));
         $(window).resize().resize(); //fixes a bug in modal overlay size ??

      },
      eventMouseover : function(calEvent, $event) {
      },
      eventMouseout : function(calEvent, $event) {
      },
      noEvents : function() {

      },
      data : function(start,end,callback) {
    	  	callback(getEventData());
    	  	
      }
   });
   

   function resetForm($dialogContent) {
      $dialogContent.find("input").val("");
   }
  
   function getEventData() {
	   var eventArr=[];
	    var id;
		var start;
		var end;
		var title;
		var currentTime;
		var year = new Date().getFullYear();
	    var month = new Date().getMonth();
	    var day = new Date().getDate();
		if(jsonlist!=null)
		for(i=0;i<jsonlist.events.length;i++) {
	  		currentTime = jsonlist.events[i];
	  		id=currentTime.id;
	  		start=currentTime.start;
	  		end=currentTime.end;
	  		title=currentTime.title;
	  		eventArr.push({"id":id,"start":start,"end":end,"title":title});	
		}
		else
		         eventArr : [
		                   {
		                      "id":1,
		                      "start": new Date(year, month, day, 12),
		                      "end": new Date(year, month, day, 13, 30),
		                      "title":"Default Check Data"
		                   }]
		
		return eventArr
   }
  
   function getEventIdFromTitle(title){
	  var eventid
	   if(jsonlist!=null)
			for(i=0;i<jsonlist.events.length;i++) {
		  		currentTime = jsonlist.events[i];
		  		if(currentTime.title==title) {
		  		eventid=currentTime.id;
		  		}
			}
	   return eventid;
   };
   /*
    * Sets up the start and end time fields in the calendar event
    * form for editing based on the calendar event being edited
    */
   function setupStartAndEndTimeFields($startTimeField, $endTimeField, calEvent, timeslotTimes) {

      for (var i = 0; i < timeslotTimes.length; i++) {
         var startTime = timeslotTimes[i].start;
         var endTime = timeslotTimes[i].end;
         var startSelected = "";
         if (startTime.getTime() === calEvent.start.getTime()) {
            startSelected = "selected=\"selected\"";
         }
         var endSelected = "";
         if (endTime.getTime() === calEvent.end.getTime()) {
            endSelected = "selected=\"selected\"";
         }
         $startTimeField.append("<option value=\"" + startTime + "\" " + startSelected + ">" + timeslotTimes[i].startFormatted + "</option>");
         $endTimeField.append("<option value=\"" + endTime + "\" " + endSelected + ">" + timeslotTimes[i].endFormatted + "</option>");

      }
      $endTimeOptions = $endTimeField.find("option");
      $startTimeField.trigger("change");
   }

   var $endTimeField = $("select[name='end']");
   var $endTimeOptions = $endTimeField.find("option");

   //reduces the end time options to be only after the start time options.
   $("select[name='start']").change(function() {
      var startTime = $(this).find(":selected").val();
      var currentEndTime = $endTimeField.find("option:selected").val();
      $endTimeField.html(
            $endTimeOptions.filter(function() {
               return startTime < $(this).val();
            })
            );

      var endTimeSelected = false;
      $endTimeField.find("option").each(function() {
         if ($(this).val() === currentEndTime) {
            $(this).attr("selected", "selected");
            endTimeSelected = true;
            return false;
         }
      });

      if (!endTimeSelected) {
         //automatically select an end date 2 slots away.
         $endTimeField.find("option:eq(1)").attr("selected", "selected");
      }
      
      if (endTimeSelected) {
    	  $('#end').change(function() {
    	        var sTime = $("#start").val();
    	              var eTime =  $("#end").val();
    	              var start = getHoursAndMins(sTime);
    	              var end = getHoursAndMins(eTime);
    	            s = start.split(':');
    	            e = end.split(':');
    	          var minsdiff=parseInt(e[0],10)*60+parseInt(e[1],10)-parseInt(s[0],10)*60-parseInt(s[1],10);
    	          var time = String(100+Math.floor(minsdiff/60)).substr(1)+'.'+String(100+minsdiff%60).substr(1);
    	        $('#hours').val(time);
    	     });
       }
   });
});



function getHoursAndMins(time){
	   var dt = new Date(time);
	      var hh=dt.getHours();
	      var mm=dt.getMinutes();
	      var hhmm=hh+":"+mm;
	      return hhmm;

}
function taskHrs() {
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
		   $(".estimatedHrs").val(currentTask.estimatedHrs); //Set values dynamically
	   }
					  
	}
}

function projectTask() {
	jQuery("#task").attr("disabled",false);
	var project=$("#project option:selected").text();
	$('#task').empty();
	$('#task').append($("<option></option>").attr("value","select following task").text("select following task")); 
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
			$('#task').append($("<option></option>").attr("value",currentTask.taskName).text(currentTask.taskName)); 
		}
	}
   
  



}

$(document).ready(function(){
			$('body').css('overflow-x','hidden');
			$('#tr1').css('background-color','lightyellow');
			$('.th1').css('background-color','lightyellow');
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
	var hours=$('#expectedtime').val();
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
				$('td[id^='+idPrefix+index+']').css('background-color','white');
			}
			for(var index = 0 ; index < color ; index++)
				{
					$('td[id='+idPrefix+idPostfix+']').css('background-color','#660066');
					idPostfix++;
				}
		}		
	}

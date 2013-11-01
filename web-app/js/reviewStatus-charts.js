jQuery(document)
		.ready(
				function() {
					// Build the chart
					/* to hide json object values */
					var columnChartData = [];
					var pieChartDynamicData = [];
					jQuery(".list").hide();
					var blockuser = 0;
					var activeUser = 0;
					var list = jQuery("#hidden").text();
					var pendingrequest = $.parseJSON(list);
					var getPendindRequest = pendingrequest.pendingRequest;
					columnChartData.push(getPendindRequest);
					var totaluser = jQuery("#hiddenuser").text();
					totalBlockUser = (getPendindRequest * 100) / totaluser;
					pieChartDynamicData.push([ "Block Users", totalBlockUser ]);
					totalActiveUser = 100 - totalBlockUser;
					pieChartDynamicData
							.push([ "Active Users", totalActiveUser ]);
					$('#pieChart')
							.highcharts(
									{
										chart : {
											plotBackgroundColor : null,
											plotBorderWidth : null,
											plotShadow : false
										},
										// To hide context-menu
										exporting : {
											buttons : {
												contextButtons : {
													enabled : false,
													menuItems : null
												}
											},
											enabled : false
										},
										title : {
											text : 'User Status '
										},
										tooltip : {
											pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
										},
										plotOptions : {
											pie : {
												allowPointSelect : true,
												cursor : 'pointer',
												dataLabels : {
													enabled : false
												},
												showInLegend : true
											}
										},
										legend : {
											enabled : true,
											layout : 'vertical',
											align : 'left',
											verticalAlign : 'top',
											borderWidth : 0,
											useHTML : true
										},
										series : [ {
											type : 'pie',
											name : 'Status Percentage',
											data : pieChartDynamicData
										} ]
									});

					$(function() {
						var yAxisLabels = [ 0, 1, 2, 3, 4, 5 ];

						$('#columnChart')
								.highcharts(
										{
											chart : {
												type : 'column'
											},
											title : {
												text : 'Pending User Request'
											},
											exporting : {
												buttons : {
													contextButtons : {
														enabled : false,
														menuItems : null
													}
												},
												enabled : false
											},
											xAxis : {
												title : {
													text : 'Pending Request'
												}
											},
											yAxis : {
												min : 0,
												tickPositioner : function() {
													return yAxisLabels;
												},
												title : {
													text : 'No. of Pending User Requests'
												}

											},
											tooltip : {
												headerFormat : '<span style="font-size:10px"></span><table>',
												pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
														+ '<td style="padding:0"><b>{point.y}</b></td></tr>',
												footerFormat : '</table>',
												shared : true,
												useHTML : true
											},
											plotOptions : {
												column : {
													pointPadding : 0.2,
													pointWidth : 50,
													borderWidth : 0
												}
											},
											series : [ {
												name : 'Pending Requests',
												data : columnChartData

											} ]
										});

					});
				});

function search() {
	jQuery("#NoSearchText").html("");
	var searchText = jQuery("#appendedInputButtons").val();

	if (searchText != "") {
		jQuery.ajax({
			global : true,
			async : false,
			type : "POST",
			url : "/tm/HRReviewStatus/searchFunction?searchTxt=" + searchText,
			success : function(data) {
				var obj = jQuery.parseJSON(data);
				$("#no-more-tables > tbody").empty();
				if ((obj.UserList.length) != 0) {
					for (i = 0; i < obj.UserList.length; i++) {
						var currentObject = obj.UserList[i];
						jQuery("#client-list").append(
								'<tr><td>' + (i + 1) + '</td> <td>'
										+ currentObject.firstName + '</td><td>'
										+ currentObject.lastName + '</td><td>'
										+ currentObject.username + '</td> <td>'
										+ currentObject.status
										+ '</td> <td></td><td></td><td>'
										+ currentObject.id
										+ '</td></td><td></tr>')
					}
				} else {
					jQuery("#NoSearchText").html(
							"<h5>No Search Item Found</h5>");
				}

			}
		});

	}

	else {
		jQuery("#NoSearchText").html(
				"<h5>Please Enter the search Item First</h5>");
		jQuery("#NoSearchText").css("color", "red");

	}
}

/* method is used to reset user search */
function reset() {
	jQuery("#appendedInputButtons").val("");
	jQuery.ajax({
		global : true,
		async : false,
		type : "POST",
		url : "/tm/HRReviewStatus/resetFunction",
		success : function(data) {
			var obj = jQuery.parseJSON(data);
			$("#no-more-tables > tbody").empty();
			for (i = 0; i < obj.UserList.length; i++) {
				var currentObject = obj.UserList[i];
				jQuery("#client-list").append(
						'<tr><td>' + (i + 1) + '</td> <td>'
								+ currentObject.firstName + '</td><td>'
								+ currentObject.lastName + '</td><td>'
								+ currentObject.username + '</td> <td>'
								+ currentObject.status
								+ '</td> <td></td><td></td><td>'
								+ currentObject.id + '</td></td><td></tr>')

			}
		}
	});
}

/* To filter users according to active status */
function active() {
	var searchText = jQuery("#active").text();
	SearchByStatus(searchText)
}
/* To filter users according to block status */
function block() {
	var searchText = jQuery("#block").text();
	SearchByStatus(searchText)
}

/* method is used to search user bu status */
function SearchByStatus(filterValue) {
	jQuery("#NoSearchText").html("");
	jQuery.ajax({
		global : true,
		async : false,
		type : "POST",
		url : "/tm/HRReviewStatus/searchFunction?searchTxt=" + filterValue,
		success : function(data) {
			var obj = jQuery.parseJSON(data);
			$("#no-more-tables > tbody").empty();
			if ((obj.UserList.length) != 0) {
				for (i = 0; i < obj.UserList.length; i++) {
					var currentObject = obj.UserList[i];
					jQuery("#client-list").append(
							'<tr><td>' + (i + 1) + '</td> <td>'
									+ currentObject.firstName + '</td><td>'
									+ currentObject.lastName + '</td><td>'
									+ currentObject.username + '</td> <td>'
									+ currentObject.status
									+ '</td> <td></td><td></td><td>'
									+ currentObject.id + '</td></td><td></tr>')
				}
			} else {
				jQuery("#NoSearchText").html("<h5>No Search Item Found</h5>");
			}

		}
	});

}
<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/module/base/nocache.jsp"%>

<!-- Bread crumb is created dynamically -->
<!-- row -->
<div class="row">
	
	<!-- col -->
	<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
		<h1 class="page-title txt-color-blueDark">
			
			<!-- PAGE HEADER -->
			<i class="fa-fw fa fa-bar-chart-o"></i> 
			<s:text name="hrm.employee.salary.dashboard"/>
		</h1>
	</div>
	<!-- end col -->
	
	<!-- right side of the page with the sparkline graphs -->
	<!-- col -->
	<div class="col-xs-12 col-sm-5 col-md-5 col-lg-8">

	</div>
	<!-- end col -->
	
</div>
<!-- end row -->

	<input name="employeeCount" value="<s:property value="employeeCount"/>" type="hidden">
	<input name="salaryCount" value="<s:property value="salaryCount"/>" type="hidden">
	<input name="payrollCount" value="<s:property value="payrollCount"/>" type="hidden">
	
<!-- widget grid -->
<section id="widget-grid" class="">

	<!-- row -->
	<div class="row">
		
		<!-- NEW WIDGET START -->
		<article class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
			
			<!-- Widget ID (each widget will need unique ID)-->
			<div class="jarviswidget" id="wid-id-4" data-widget-colorbutton="false" data-widget-fullscreenbutton="false" data-widget-editbutton="false" data-widget-sortable="false" data-widget-colorbutton="true">

				<header>

					<h2> Diagrami pagave  - Doughnut Chart </h2>				
					
				</header>

				<!-- widget div-->
				<div>
					
					<!-- widget edit box -->
					<div class="jarviswidget-editbox">
						<!-- This area used as dropdown edit box -->
						<input class="form-control" type="text">	
					</div>
					<!-- end widget edit box -->
					
					<!-- widget content -->
					<div class="widget-body">
						
						<!-- this is what the user will see -->
						<canvas id="doughnutChart" height="120"></canvas>

					</div>
					<!-- end widget content -->
					
				</div>
				<!-- end widget div -->
				
			</div>
			<!-- end widget -->
			
			<!-- Widget ID (each widget will need unique ID)-->
			<div class="jarviswidget" id="wid-id-6" data-widget-colorbutton="false" data-widget-fullscreenbutton="false" data-widget-editbutton="false" data-widget-sortable="false">

				<header>

					<h2>Diagrami pagave  - Pie Chart </h2>				
					
				</header>

				<!-- widget div-->
				<div>
					
					<!-- widget edit box -->
					<div class="jarviswidget-editbox">
						<!-- This area used as dropdown edit box -->
						<input class="form-control" type="text">	
					</div>
					<!-- end widget edit box -->
					
					<!-- widget content -->
					<div class="widget-body">
						
						<!-- this is what the user will see -->
						<canvas id="pieChart" height="120"></canvas>

					</div>
					<!-- end widget content -->
					
				</div>
				<!-- end widget div -->
				
			</div>
			<!-- end widget -->			
			
			

		</article>
		<!-- WIDGET END -->

		<!-- NEW WIDGET START -->
		<article class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
			
			<!-- Widget ID (each widget will need unique ID)-->
			<div class="jarviswidget" id="wid-id-0" data-widget-colorbutton="false" data-widget-fullscreenbutton="false" data-widget-editbutton="false" data-widget-sortable="false" data-widget-colorbutton="true">
				<!-- widget options:
					usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false">
					
						
					data-widget-editbutton="false"
					data-widget-togglebutton="false"
					data-widget-deletebutton="false"
					data-widget-fullscreenbutton="false"
					data-widget-custombutton="false"
					data-widget-collapsed="true" 
					data-widget-sortable="false"
					
				-->
				<header>
					
					<h2>Diagrami pagave  - Line Chart </h2>				
					
				</header>

				<!-- widget div-->
				<div>
					
					<!-- widget edit box -->
					<div class="jarviswidget-editbox">
						<!-- This area used as dropdown edit box -->
						<input class="form-control" type="text">	
					</div>
					<!-- end widget edit box -->
					
					<!-- widget content -->
					<div class="widget-body">
						<!-- this is what the user will see -->
						<canvas id="lineChart" height="120"></canvas>
					</div>
					<!-- end widget content -->
					
				</div>
				<!-- end widget div -->
				
			</div>
			<!-- end widget -->
						
			<!-- Widget ID (each widget will need unique ID)-->
			<div class="jarviswidget" id="wid-id-2" data-widget-colorbutton="false" data-widget-fullscreenbutton="false" data-widget-editbutton="false" data-widget-sortable="false">
				<!-- widget options:
					usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false">
					
					data-widget-colorbutton="false"	
					data-widget-editbutton="false"
					data-widget-togglebutton="false"
					data-widget-deletebutton="false"
					data-widget-fullscreenbutton="false"
					data-widget-custombutton="false"
					data-widget-collapsed="true" 
					data-widget-sortable="false"
					
				-->
				<header>

					<h2>Diagrami pagave  - Viti Fiskal 2020	</h2>				
					
				</header>

				<!-- widget div-->
				<div>
					
					<!-- widget edit box -->
					<div class="jarviswidget-editbox">
						<!-- This area used as dropdown edit box -->
						<input class="form-control" type="text">	
					</div>
					<!-- end widget edit box -->
					
					<!-- widget content -->
					<div class="widget-body">
						
						<!-- this is what the user will see -->
						<canvas id="barChart" height="120"></canvas>

					</div>
					<!-- end widget content -->
					
				</div>
				<!-- end widget div -->
				
			</div>
			<!-- end widget -->
									


		</article>
		<!-- WIDGET END -->
		
	</div>

	<!-- end row -->

	<!-- row -->

	<div class="row">

		<!-- a blank row to get started -->
		<div class="col-sm-12">
		
		<table class="table" id="dataTable" style="display: none;">
		  <thead>
		    <th>Year</th>
		    <th>PayMonth</th>
		    <th>Status</th>
		    <th>Count</th>
		  </thead>
		  <tbody>
		  <s:iterator value="dataView" var="searchList" status="st">
		    <tr>
		      <td><s:property value="#searchList[0]" /></td>
		      <td><s:property value="#searchList[1]" /></td>
		      <td><s:property value="#searchList[2]" /></td>
		      <td><s:property value="#searchList[3]" /></td>
		    </tr>
		</s:iterator>    
		 </tbody>
		</table>    

		</div>
			
	</div>

	<!-- end row -->

</section>
<!-- end widget grid -->

<script>
	
	/* DO NOT REMOVE : GLOBAL FUNCTIONS!
	 *
	 * pageSetUp() is needed whenever you load a page.
	 * It initializes and checks for all basic elements of the page
	 * and makes rendering easier.
	 *
	 */

	pageSetUp();
	
	/*
	 * ALL PAGE RELATED SCRIPTS CAN GO BELOW HERE
	 * eg alert("my home function");
	 * 
	 * var pagefunction = function() {
	 *   ...
	 * }
	 * loadScript("js/plugin/_PLUGIN_NAME_.js", pagefunction);
	 * 
	 * TO LOAD A SCRIPT:
	 * var pagefunction = function (){ 
	 *  loadScript(".../plugin.js", run_after_loaded);	
	 * }
	 * 
	 * OR you can load chain scripts by doing
	 * 
	 * loadScript(".../plugin.js", function(){
	 * 	 loadScript("../plugin.js", function(){
	 * 	   ...
	 *   })
	 * });
	 */

	 /*
	 function getData(jsonData, status, month){
		  for (var obj of json) {
			  if(obj.paymonth == month && obj.status == status){
				 return obj.count;
			  } 
		  }	
		  return 0;
	 }

	 var table = document.getElementById('dataTable');
	 var json = []; // First row needs to be headers 
	 var headers = [];
	 for (var i = 0; i < table.rows[0].cells.length; i++) {
	   headers[i] = table.rows[0].cells[i].innerHTML.toLowerCase().replace(/ /gi, '');
	 }

	 // Go through cells 
	 for (var i = 1; i < table.rows.length; i++) {
	   var tableRow = table.rows[i];
	   var rowData = {};
	   for (var j = 0; j < tableRow.cells.length; j++) {
	     rowData[headers[j]] = tableRow.cells[j].innerHTML;
	   }

	   json.push(rowData);
	 }

	 console.log(json);

	// Map JSON values back to label array
	 var labels = json.map(function (e) {
	   return e.status;
	 });
	 console.log(labels); 

	 // Map JSON values back to values array
	 var values = json.map(function (e) {	
	   return e.count;
	 });
	 console.log(values); 
	 */



	var LineConfig, barChartData, RadarConfig, DoughtnutConfig, PolarConfig, PieConfig;
	var jsonDataX = [];
	var jsonDataY = [];

	$.ajax({
		type : "GET",
		url : "SalaryJsonData.getSalaryMonthsByStatus.do", 
		async : false,
		beforeSend:function(jqXHR, settings) {
		},
		error : function(errorThrown, status, jqXHR) { // on error..
			alert("error:" + errorThrown + ", status:" + status);
		},
		success : function(data, status, jqXHR) { // on success..
			console.log(data);
			jsonDataX = JSON.parse(data);
			jsonDataY = JSON.parse(data);
		},
		complete:function(jqXHR, textStatus){
		}
	});

	// pagefunction

	var pagefunction = function() {
		// clears the variable if left blank
		
			

			// reference: http://www.chartjs.org/docs/
				var randomScalingFactor = function() {
		            return Math.round(Math.random() * 100);
		            //return 0;
		        };
		        var randomColorFactor = function() {
		            return Math.round(Math.random() * 255);
		        };
		        var randomColor = function(opacity) {
		            return 'rgba(' + randomColorFactor() + ',' + randomColorFactor() + ',' + randomColorFactor() + ',' + (opacity || '.3') + ')';
		        };


		        LineConfig = {
		            type: 'line',
		            data: jsonDataY.data, 
			            /*{
		            	
			            labels: ["January", "February", "March", "April", "May", "June", "July"],
		                datasets: [{
		                    label: "My First dataset",
		                    data: [randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor()],
		                    
		                }, {
		                    label: "My Second dataset",
		                    data: [randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor()],
		                }]
                                    }*/
		            options: {
		                responsive: true,
		                tooltips: {
		                    mode: 'label'
		                },
		                hover: {
		                    mode: 'dataset'
		                },
		                scales: {
		                    xAxes: [{
		                        display: true,
		                        scaleLabel: {
		                            show: true,
		                            labelString: 'Month'
		                        }
		                    }],
		                    yAxes: [{
		                        display: true,
		                        scaleLabel: {
		                            show: true,
		                            labelString: 'Value'
		                        },
		                        ticks: {
		                            suggestedMin: 0,
		                            suggestedMax: 100,
		                        }
		                    }]
		                }
		            }
		        };
		        $.each(LineConfig.data.datasets, function(i, dataset) {
		            dataset.borderColor = 'rgba(0,0,0,0.15)';
		            dataset.backgroundColor = randomColor(0.5);
		            dataset.pointBorderColor = 'rgba(0,0,0,0.15)';
		            dataset.pointBackgroundColor = randomColor(0.5);
		            dataset.pointBorderWidth = 1;
		        });


		        // bar chart example
				            /*
			                "#F7464A Red",
			                "#46BFBD Green",
			                "#FDB45C Yellow",
			                "#949FB1 Grey",
			                "#4D5360 Dark Grey"
			                backgroundColor: "rgba(151,187,205,0.5)",
			                */

		        barChartData = {
		            labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
		            datasets: jsonDataX.rows
		        };

	        // radar example


		        RadarConfig = {
			        type: 'radar',
			        data: {
			            labels: ["Eating", "Drinking", "Sleeping", "Designing", "Coding", "Cycling", "Running"],
			            datasets: [{
			                label: "My First dataset",
			                backgroundColor: "rgba(220,220,220,0.2)",
			                pointBackgroundColor: "rgba(220,220,220,1)",
			                data: [randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor()]
			            }, {
			                label: "My Second dataset",
			                backgroundColor: "rgba(151,187,205,0.2)",
			                pointBackgroundColor: "rgba(151,187,205,1)",
			                hoverPointBackgroundColor: "#fff",
			                pointHighlightStroke: "rgba(151,187,205,1)",
			                data: [randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor()]
			            },]
			        },
			        options: {
			            legend: {
			                position: 'top',
			            },
			            
			            scale: {
			              reverse: false,
			              ticks: {
			                beginAtZero: true
			              }
			            }
			        }
			    };


			    // doughnut example

			    DoughtnutConfig = {
			        type: 'doughnut',
			        data: {
			            datasets: [{
			                data: [
			                	<s:property value="employeeCount"/>,
			                	<s:property value="salaryCount"/>,
		                	    <s:property value="payrollCount"/>,
			                ],
			                backgroundColor: [
			                    "#949FB1",
			                    "#46BFBD",
			                    "#FDB45C"
			                    /*
			                    "#949FB1",
			                    "#4D5360",
			                    */
			                ],
			                label: 'Dataset 1'
			            }],
			            labels: [
			            	"Employee <s:property value='employeeCount'/>",
			            	"Salary <s:property value='salaryCount'/>",
			            	"Payroll <s:property value='payrollCount'/>"
				            /*
			                "#F7464A Red",
			                "#46BFBD Green",
			                "#FDB45C Yellow",
			                "#949FB1 Grey",
			                "#4D5360 Dark Grey"
			                */
			            ]
			        },
			        options: {
			            responsive: true,
			            legend: {
			                position: 'top',
			            }
			        }
			    };


			    // polar chart example 


			    PolarConfig = {
			        data: {
			            datasets: [{
			                data: [
			                	<s:property value="employeeCount"/>,
			                	<s:property value="salaryCount"/>,
		                	    <s:property value="payrollCount"/>,
			                ],
			                backgroundColor: [
			                    "#949FB1",
			                    "#46BFBD",
			                    "#FDB45C"
			                    /*
			                    "#949FB1",
			                    "#4D5360",
			                    */
			                ],
			                label: 'Dataset 1'
			            }],
			            labels: [
			            	"Employee <s:property value='employeeCount'/>",
			            	"Salary <s:property value='salaryCount'/>",
			            	"Payroll <s:property value='payrollCount'/>"
				            /*
			                "#F7464A Red",
			                "#46BFBD Green",
			                "#FDB45C Yellow",
			                "#949FB1 Grey",
			                "#4D5360 Dark Grey"
			                */
			            ]
			        },
			        options: {
			            responsive: true,
			            legend: {
			                position: 'top',
			            },
			            title: {
			                display: true,
			                text: 'Our Favorite Dataset'
			            },
			            scale: {
			              ticks: {
			                beginAtZero: true
			              },
			              reverse: false
			            },
			            animateRotate:false
			        }
			    };


			    // pie chart example
			    PieConfig = {
			        type: 'pie',
			        data: {
			            datasets: [{
			                data: [
			                	<s:property value="employeeCount"/>,
			                	<s:property value="salaryCount"/>,
		                	    <s:property value="payrollCount"/>,
			                ],
			                backgroundColor: [
			                    "#949FB1",
			                    "#46BFBD",
			                    "#FDB45C"
			                    /*
			                    "#949FB1",
			                    "#4D5360",
			                    */
			                ],
			                label: 'Dataset 1'
			            }],
			            labels: [
			            	"Employee <s:property value='employeeCount'/>",
			            	"Salary <s:property value='salaryCount'/>",
			            	"Payroll <s:property value='payrollCount'/>"
				            /*
			                "#F7464A Red",
			                "#46BFBD Green",
			                "#FDB45C Yellow",
			                "#949FB1 Grey",
			                "#4D5360 Dark Grey"
			                */
			            ]
			        },
			        options: {
			            responsive: true
			        }
			    };

				
	            myLine = new Chart(document.getElementById("lineChart"), LineConfig);
	            myBar = new Chart(document.getElementById("barChart"), {
	                type: 'bar',
	                data: jsonDataX.data,
	                options: {
	                    responsive: true,
	                }
	            });
	            //myRadar = new Chart(document.getElementById("radarChart"), RadarConfig);
    			myDoughnut = new Chart(document.getElementById("doughnutChart"), DoughtnutConfig);
    			//myPolarArea = Chart.PolarArea(document.getElementById("polarChart"), PolarConfig);
    			myPie = new Chart(document.getElementById("pieChart"), PieConfig);
		    

	};
	
		loadScript("js/plugin/moment/moment.min.js", function(){
		loadScript("js/plugin/chartjs/chart.min.js", pagefunction)}); 

	// end pagefunction

	// destroy generated instances 
	// pagedestroy is called automatically before loading a new page
	// only usable in AJAX version!

	var pagedestroy = function(){
		
		//destroy all charts
    	myLine.destroy();
		LineConfig=null;

    	myBar.destroy();
    	barChartData=null;

    	myDoughnut.destroy();
    	DoughtnutConfig=null;

    	myPolarArea.destroy();
    	PolarConfig=null;

    	myPie.destroy();
    	PieConfig=null;

    	if (debugState){
			root.console.log("✔ Chart.js charts destroyed");
		} 
	}

	// end destroy
	
</script>
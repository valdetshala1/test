<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
ui-grid{ width:100% !important; }
</style>
        <script type="text/javascript">
        $(document).ready(function () {
        	jQuery("#attendance_grid").jqGrid({
        	   	url:'HrmGrid.attendanceRecord.do?',	
        	   	mtype: 'GET',
        		datatype: "json",
        		jsonReader : {
   			      root:"rows",
   			      page: "page",
   			      total: "total",
   			      records: "records",
   			      repeatitems: false,
   			      id: "0"
        		},
        		height: '100%',
        		width: '100%',
        		autowidth: true,
        		shrinkToFit: false,
        		gridview: true,
                headertitles: true,
                viewrecords: true,
                rownumbers: true,
                //picture, name, title, Hier date, work email, work phone, contract type / Employment status
        	  colNames:['Id',
        	        	  '<s:text name="report.damage.grid.label.employee"/>',
        	        	  '<s:text name="label.person.firstname"/>', 
        	        	  '<s:text name="label.person.lastname"/>',
        	        	  '<s:text name="hrm.attendance.label.punch.in.utc.time"/>', 
        	        	  '<s:text name="hrm.attendace.label.punch.in.note"/>',
        	        	  '<s:text name="hrm.attendance.label.punch.in.user.time"/>',
        	        	  '<s:text name="hrm.attendance.label.punch.out.utc.time"/>', 
        	        	  '<s:text name="hrm.attendance.label.punch.out.notes"/>',
        	        	  '<s:text name="hrm.attendance.label.punch.out.user.time"/>',
        	        	  '<s:text name="annu.appprivate.label.status"/>',
        	        	  '<s:text name="htm.attendance.grid.supervisor.user.id"/>',
        	        	  '<s:text name="htm.attendance.grid.supervisor.date"/>',
        	        	  '<s:text name="hum.employee.label.notes"/>'
        	        	],
        	   	colModel:[
					{name:'id',index:'id', hidden:true,width:'100%',search:false},	   	
        	   		{name:'employee_id',hidden:true, index:'employee_id', width:'100%'},
        	   		{name:'first_name',index:'p.first_name', width:'100%', align:"center",search:true},
        	   		{name:'last_name',index:'p.last_name', width:'100%', align:"center",search:true},
        	   		{name:'punch_in_utc_time',index:'punch_in_utc_time', width:'100%', align:"center",search:false},
        	   		{name:'punch_in_note',index :'punch_in_note', width:'100%', align:"right",sortable:false,search:false},
        	   		{name:'punch_in_user_time',index:'punch_in_user_time', width:'100%', align:"center",search:false},
        	   		{name:'punch_out_utc_time',index:'punch_out_utc_time', width:'100%', align:"center",search:false},
        	   		{name:'punch_out_note',index :'punch_out_note', width:'100%', align:"right",sortable:false,search:false},
        	   		{name:'punch_out_user_time',index:'punch_out_user_time', width:'100%', align:"center",search:false},		
        	   		{name:'status',index:'status', width:'100%',align:"left",search:false},
        	   		{name:'supervisor_user_id',index :'supervisor_user_id', width:'100%', align:"right",search:false},
        	   		{name:'supervisor_date',index:'supervisor_date', width:'100%', align:"center",hidden:true,search:false},		
        	   		{name:'note',index:'note', width:'100%',align:"right",sortable:false,search:false}	
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#attendance_grid_pager',
        	   	sortname: 'a.id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: true,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>', 
        		loadComplete: function(data){
                },
    			ondblClickRow: function(id, iRow, iCol, e) {
//     				var rowData = jQuery(this).getRowData(iRow); 
//     				var link = "AttendanceRecord.form.do?attendanceId=" + rowData.id;
//     				loadURL(link, $("#attendance_form_content"));
    								
   				}        		

        	});	
        	$("#attendance_grid").navGrid('#attendance_grid_pager',{edit:false,add:false,del:false,search:false})
        	.jqGrid('filterToolbar',{searchOperators : true});
        	<s:if test="isSupervisor==true">
           	$("#attendance_grid").navButtonAdd('#attendance_grid_pager',{
           	   caption:"", 
           	   title:"<s:text name="label.button.edit"/>",  
           	   buttonicon:"ui-icon-pencil", 
           	   onClickButton: function(){ 
           			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
           			if(iRow){
        				var rowData;
        				var selectedRows=jQuery(this).getGridParam('selarrrow');
						var selectedId=jQuery(this).getRowData(selectedRows[0]).id;
						for(var i=1;i<selectedRows.length;i++)
							{
								rowData=jQuery(this).getRowData(selectedRows[i]);
								selectedId=selectedId+","+rowData.id; 
								
							}
//         				  $( "#toChangeStatus" ).val(selectedId);
//         				var link = "AttendanceRecord.form.do?attendanceId=" + rowData.id;
//         				loadURL(link, $("#employee_form_content"));
//         				dialog.dialog("open");
					var link="AttendanceRecord.popup.do?toChangeStatus="+selectedId;
        			openDialogForm('attendanceStatusPopup',link,"<s:text name="attendanceRecord.change.status"/>",600,400); 
           			}else{
           	   			alert("<s:text name="global.please.select.row"/>"); 
           	   		}   
           	   }, 
           	   position:"last"
           	});
           	</s:if>
//            $("#attendance_grid").navButtonAdd('#attendance_grid_pager',{
//            	   caption:"",
//            	   title:"<s:text name="label.button.deletelabel.button.delete"/>", 
//            	   buttonicon:"ui-icon-trash", 
//            	   onClickButton: function(){ 
//            	      alert("<s:text name="alarm.deleting.row"/>"); 
//            	   }, 
//            	   position:"last"
//            	});

        // modal dialog init: custom buttons and a "close" callback reseting the form inside
       	var dialog = $("#changeStatus").dialog({
       		autoOpen : false,
       		width : 600,
       		resizable : false,
       		modal : true,
       		buttons : [{
       			html : "<i class='fa fa-times'></i>&nbsp; Cancel",
       			"class" : "btn btn-default",
       			click : function() {
       				$(this).dialog("close");

       			}
       		}, {

       			html : "<i class='fa fa-plus'></i>&nbsp; Edit",
       			"class" : "btn btn-danger",
       			click : function() {
       					$('#attendance_status_form').submit();
       				
       				$(this).dialog("close");
       			}
       		}]
       	});
       	$("#attendance_status_form").submit(function() {
			var this_form = $(this);
			$.ajax({
				data : this_form.serialize(), // get the form data
				type : this_form.attr('method'), // GET or POST
				url : this_form.attr('action'), // the file to call
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
// 					$("#attendance_form_content").html(jqXHR.responseText);
					jQuery("#attendance_grid").trigger("reloadGrid");
					var errors_exits = jqXHR.getResponseHeader("errors_exits");
					if (errors_exits == "true") {
					} else {
						//$("#farmer_expander").html(jqXHR.responseText);
					}
				},
				complete : function(jqXHR, textStatus) {
					//$('#ajaxBusyFarmer').hide();
				}
			});
			return false;
		}); 
       	jQuery("#attendance_grid").navButtonAdd('#attendance_grid_pager',{
		   	   caption:"<s:text name="report.grid.caption"/>", 
		   	   title:"<s:text name="label.button.report.generator"/>",  
		   	   buttonicon: "ui-icon-print", 
		   	   onClickButton: function(){ 
			   		var link = "AttendanceRecord.reportPopup.do";
			   		openDialogForm('attendanceReportGen',link,"<s:text name="label.button.report.generator"/>",800,420); 
		   		
		   	   }, 
		   	   position:"last"
	   	});           	

        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_att_container').width();
            $('#attendance_grid').setGridWidth(width);
        });
                
        /* Remove jquery-ui styles from jqgrid */
        function removeJqgridUiStyles(){
            $(".ui-jqgrid").removeClass("ui-widget ui-widget-content");
            $(".ui-jqgrid-view").children().removeClass("ui-widget-header ui-state-default");
            $(".ui-jqgrid-labels, .ui-search-toolbar").children().removeClass("ui-state-default ui-th-column ui-th-ltr");
            $(".ui-jqgrid-pager").removeClass("ui-state-default");
        }        
    </script>
    
</head>
<body>
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">

			<div id="jqGrid_att_container">
				<table id="attendance_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
				<div id="attendance_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>

			<!-- End Dialog view for editing status from supervisor -->
		</div>
		<!-- end widget div -->
 </body>   
			
</html>	

<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
ui-grid {
	width: 100% !important;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
			
        register_grid = jQuery("#register_grid").jqGrid({
    	   	url:'DhpetGrid.tourismRegister.do',	
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
    		shrinkToFit: true,
    		gridview: true,
            headertitles: true,
            viewrecords: true,
            rownumbers: true,
    	   	colNames:['Id', 
    	   				'',
    	        	   	'<s:text name="dhpet.location"/>',
    	        	   	'<s:text name="dhpet.register.dhpetTouristPurpose"/>', 
    	      	    	'<s:text name="dem.fiskos.start.date"/>', 
    	      	    	'<s:text name="dem.fiskos.end.date"/>',
    	        	   	'<s:text name="purchase.order.payment"/>', 
    	      	    	'<s:text name="dhpet.register.dhpetTouristNumber"/>', 
    	      	    	'<s:text name="hum.employee.label.notes"/>', 
    	        	   	'<s:text name="bid.grid.created.by"/>',
    	        	   	'<s:text name="bid.grid.created.date"/>'
    	        	 ],
    	   	colModel:[
    	   		{name:'id',index:'id',hidden:true, width:'50%'},
    	   		{name:'act',index:'act', width:'50%',search:false},
    	   		{name:'location_name',index:'location_name', width:'100%'},
    	   		{name:'purpose_name',index:'purpose_name', width:'100%'},
    	   		{name:'start_date',index:'start_date', width:'100%'},
    	   		{name:'end_date',index:'end_date', width:'100%'},
    	   		{name:'payment',index:'payment', width:'100%'},
    	   		{name:'tourist_number',index:'tourist_number', width:'100%'},
    	   		{name:'note',index:'note', width:'100%'},
    	   		{name:'created_date',index:'created_date', width:'100%', align:"center"},
    	   		{name:'created_by',index:'created_by', width:'100%', align:"center"}
    	   	],
    	   	rowNum:10,
    	   	rowList:[10,20,30],
    	   	pager: '#register_grid_pager',
    	   	gridComplete: function(){
        		var ids = jQuery("#register_grid").jqGrid('getDataIDs');
        		for(var i=0;i < ids.length;i++){
        			var cl = ids[i];
        				au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('DhpetTouristRegister','#register_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        				jQuery("#register_grid").jqGrid('setRowData',ids[i],{act:au});
        		}	
        	},
    	   	sortname: 'id',
    	    viewrecords: true,
    	    sortorder: "desc",
    		multiselect: false,
    		caption: "",
    		loadtext:'<s:text name="grid.loading.text"/>', 
    		ondblClickRow: function(id, iRow, iCol, e) {
				var rowData = jQuery(this).getRowData(iRow); 
				var link = "TouristRegister.form.do?registerId=" + rowData.id;
				loadURL(link, $("#register_form_content"));
			}       		

    	});		

    	register_grid.jqGrid('navGrid','#register_grid_pager',
            	{edit: false, add:false, del:false, refresh:true, view:false,search:false},
    			{}, {},{},{multipleSearch:true,recreateFilter:true});
    	
    	register_grid.navButtonAdd('#register_grid_pager',{
  	   	   caption:"", 
  	   	   title:"<s:text name="fin.allocation.label.generate.report"/>", 
  	   	   buttonicon:"ui-icon-print", 
  	   	   onClickButton: function(){ 
  	   		    var link="\\frm\\dhpet\\tourism\\tourisem_report.rptdesign";
  				//var	url="JasperReportGen.do?genQrCode=true&jsonObj=&report_path="+link+"&doc_name=Vengjuetite&doc_format=pdf";
  				var parameters='test=1';
  	   		    var	url="BirtReportGen.do?genQrCode=true&jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name=Lokacionet_e_vendgjuetise&doc_format=pdf";

  				generateJasperDoc(url);
  	   	   }, 
  	   	   position:"last"
  		  });
		
    	register_grid.jqGrid('navGrid','#animallocation_grid_pager',
            	{edit: false, add:false, del:false, refresh:true, view:false,search:false},
    			{}, {},{},{multipleSearch:true,recreateFilter:true})
        	.navButtonAdd('#register_grid_pager',{
         	   	   caption:"", 
        	   	   title:"<s:text name="label.button.edit"/>", 
        	   	   buttonicon:"ui-icon-pencil", 
        	   	   onClickButton: function(){ 
        	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
        	   			if(iRow){
        	   				var rowData = jQuery(this).getRowData(iRow); 
            				var link = "TouristRegister.form.do?registerId=" + rowData.id;
        					loadURL(link, $("#register_form_content"));
        	   			}else{
        	   	   			alert("<s:text name="global.please.select.row"/>");
        	   	   		}   
        	   	   }, 
        	   	   position:"last"
             });
	});
        			
	$(window).bind('resize', function() {
		var width = $('#jqGrid_register_container').width();
		$('#register_grid').setGridWidth(width);
	});


</script>

</head>
<body>

	<!-- widget div-->
	<div style="margin-bottom: 1.0em;">
		<div id="jqGrid_register_container">
			<table id="register_grid" class="scroll" cellpadding="0" cellspacing="0"></table>
			<div id="register_grid_pager" class="scroll" style="text-align: center;"></div>
		</div>

	</div>
	<!-- end widget div -->
	

</body>

</html>

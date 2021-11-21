<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
.unchecked{ background-color:red !important; }
ui-grid{ width:100% !important; }
.checkbox-grid li {
    display: block;
    float: right;
    width: 20%;
}
</style>
        <script type="text/javascript">

        function edittouristZoneGeoms(grid, rowId){
        	var rowData=jQuery("#tourist_zone_geoms_grid").getRowData(rowId);
        	var link = "TouristZoneGeoms.form.do?touristZoneGeomsId=" + rowData.id;
        	loadURL(link,$("#tourist_zone_geoms_form_content"));
        	loadTouristZoneGeomsFeature(rowData.id);
        }

        var link ;
        $(document).ready(function () {
            link = 'TouristZoneGeomsGrid.touristZoneGeoms.do';
        	jQuery("#tourist_zone_geoms_grid").jqGrid({
        	   	url:link,	
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
        	   	colNames:['ID', 
       	        	   	'',
       	        	 	'<s:text name="touristZoneGeoms.dhpetLocation.id"/>',
       	        	   	'<s:text name="dhpet.tourist.zone.geoms.zonetype"/>',
       	        	   	'<s:text name="leave.ent.label.note"/>',
       	        	   	'<s:text name="planting.stand.planned.area"/>',
       	        	   	'<s:text name="hum.employee.label.created.date"/>',
       	        	   	'<s:text name="budget.maintenance.financial.created.by"/>'
        	   		],       	   	
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'50%'},
        	   		{name:'act',index:'act', width:'50%',search:false},
        	   		{name:'location',index:'location', width:'100%',align:"center",search:false},
        	   		{name:'zone_type',index:'zone_type', width:'100%',align:"center",search:false},
        	   		{name:'note',index:'note', width:'100%',align:"center",search:false},
        	   		{name:'area',index:'area', width:'100%',align:"center",search:false},
        	   		{name:'created_date',index:'created_date', width:'100%',align:"center",search:false},
        	   		{name:'created_by',index:'created_by', width:'100%',align:"center",search:false}
        	   		],
        	   	rowNum: 10,
        	   	rowList:[10,20,30],
        	   	pager: '#tourist_zone_geoms_grid_pager',
        	   	sortname: 'id',
				gridComplete: function(){
        			var ids = jQuery("#tourist_zone_geoms_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					pa = "<button class='btn btn-xs btn-default' data-original-title='Request Impl' onclick=\"edittouristZoneGeoms('#tourist_zone_geoms_grid', '"+cl+"');\"><i class='fa fa-pencil'></i></button>";
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('DhpetTouristZoneGeoms','#tourist_zone_geoms_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#tourist_zone_geoms_grid").jqGrid('setRowData',ids[i],{act:pa+au});
        			}	
        		},
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiboxonly:true,
        		loadComplete: function (){
        			var rowIDs = jQuery("#tourist_zone_geoms_grid").getDataIDs(); 
        		      for (var i=0;i<rowIDs.length;i=i+1){ 
        		        rowData=jQuery("#tourist_zone_geoms_grid").getRowData(rowIDs[i]);
        		        var trElement = jQuery("#"+ rowIDs[i],jQuery('#tourist_zone_geoms_grid'));
        		        if (rowData.status == 'UCH') { 
        		            trElement.removeClass('ui-widget-content');
        		            trElement.addClass('unchecked');
        		        }
        		      }
        		},
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>'

        	});
              	
        	jQuery("#tourist_zone_geoms_grid").jqGrid('navGrid','#tourist_zone_geoms_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false,search:false});
          	
             jQuery("#tourist_zone_geoms_grid").navButtonAdd('#tourist_zone_geoms_grid_pager',{
     	   	   caption:"", 
     	   	   title:"<s:text name="fin.allocation.label.generate.report"/>", 
     	   	   buttonicon:"ui-icon-print", 
     	   	   onClickButton: function(){ 
     	   		    var link="\\frm\\dhpet\\tourism\\turisem_zone_report.rptdesign";
     				//var	url="JasperReportGen.do?genQrCode=true&jsonObj=&report_path="+link+"&doc_name=Vengjuetite&doc_format=pdf";
     				var parameters='test=1';
     	   		    var	url="BirtReportGen.do?genQrCode=true&jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name=Lokacionet_e_vendgjuetise&doc_format=pdf";

     				generateJasperDoc(url);
     	   	   }, 
     	   	   position:"last"
     		  });
        $(window).bind('resize', function() {
            var width = $('#jqgrid_dhpettzg_container').width();
            $('#tourist_zone_geoms_grid').setGridWidth(width);
        });
                
        /* Remove jquery-ui styles from jqgrid */
        function removeJqgridUiStyles(){
            $(".ui-jqgrid").removeClass("ui-widget ui-widget-content");
            $(".ui-jqgrid-view").children().removeClass("ui-widget-header ui-state-default");
            $(".ui-jqgrid-labels, .ui-search-toolbar").children().removeClass("ui-state-default ui-th-column ui-th-ltr");
            $(".ui-jqgrid-pager").removeClass("ui-state-default");
        }   
      
        });     
        
    </script>
    
</head>
<body>
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">
			<div id="jqgrid_dhpettzg_container">
				<table id="tourist_zone_geoms_grid" class="scroll"></table> 
				<div id="tourist_zone_geoms_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->
		
		<div style="margin-bottom: 1.0em;">
			<legend></legend>
			<jsp:include page="tourist_zone_geoms_form.jsp"></jsp:include>
		</div>
		
 </body>  
</html>	

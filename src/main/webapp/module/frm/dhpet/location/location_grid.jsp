<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
ui-grid{ width:100% !important; }
</style>
        <script type="text/javascript">
        function editLocation(grid, rowId){
        	var rowData=jQuery("#location_grid").getRowData(rowId);
        	var link = "Location.form.do?dhpetLocationId=" + rowData.id;
			loadURL(link, $("#location_form_content"));
			loadRequestFeature(rowData.id);
        }
        $(document).ready(function () {
        	jQuery("#location_grid").jqGrid({
        	   	url:'DhpetGrid.locationGrid.do?',	
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
        	   	colNames:['id',
        	        	    '',
        	   	      	    '<s:text name="annual.plan.municipality"/>',
        	        	   	'<s:text name="frm.dhpet.animal.capacity.habitat.location.label"/>',
        	        	   	'<s:text name="frm.dhpet.location.hunting.area.type"/>',
        	        	   	'<s:text name="frm.dhpet.location.hunter.superintendby"/>',
        	        		'<s:text name="annu.mgmt.unit.label.area.ha"/>',
							'<s:text name="dhpet.location.label.comments"/>',
							'<s:text name="planting.stand.impl.created.date"/>',
	        	        	'<s:text name="planting.stand.impl.created.by"/>',
			],
      	   		colModel:[
	      	      	{name:'id',index:'id', hidden:true, width:'100%'},
	      	      	{name:'act',index:'act', width:'50%',search:false},
	      	      	{name:'municipality',index:'municipality',width:'100%'},
	      	   		{name:'habitat_location',index:'habitat_location',width:'100%'},
	      	   	    {name:'hunting_area_type',index:'hunting_area_type',width:'100%'},
	      	   		{name:'superintend_by',index:'superintend_by',width:'100%'},
	      	   	    {name:'area',index:'area',width:'50%'},
					{name:'comments',index:'comments',width:'50%'},
					{name:'createdBy',index:'createdBy', width:'100%', search:false},
					{name:'created',index:'created', width:'50%',align:"center", search:false}
        	   		
      	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#location_grid_pager',
        	   	sortname: 'id',
        	   	gridComplete: function(){
        			var ids = jQuery("#location_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        				    au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showAuditGeom('DhpetLocation','#location_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					pa  = "<button class='btn btn-xs btn-default' data-original-title='Request Impl' onclick=\"editLocation('#location_grid', '"+cl+"');\"><i class='fa fa-pencil'></i></button>";
        					jQuery("#location_grid").jqGrid('setRowData',ids[i],{act:pa+" " +au});
        			}	
        		},
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "Location.form.do?dhpetLocationId=" + rowData.id;
    				loadURL(link, $("#location_form_content"));
   				}        		
        	});
       	 jQuery("#location_grid").jqGrid('navGrid','#location_grid_pager',
               	{edit: false, add:false, del:false, refresh:true, view:false},
       			{}, {},{},{multipleSearch:true,recreateFilter:true})
        jQuery("#location_grid").navButtonAdd('#location_grid_pager',{
	   	   caption:"", 
	   	   title:"<s:text name="fin.allocation.label.generate.report"/>", 
	   	   buttonicon:"ui-icon-print", 
	   	   onClickButton: function(){ 
	   		    var link="\\frm\\dhpet\\animallocation\\location_hunting.rptdesign";
				//var	url="JasperReportGen.do?genQrCode=true&jsonObj=&report_path="+link+"&doc_name=Vengjuetite&doc_format=pdf";
				var parameters='test=1';
	   		    var	url="BirtReportGen.do?genQrCode=true&jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name=Lokacionet_e_vendgjuetise&doc_format=pdf";

				generateJasperDoc(url);
	   	   }, 
	   	   position:"last"
		  });

        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_location_container').width();
            $('#location_grid').setGridWidth(width);
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
			<div id="jqGrid_location_container">
				<table id="location_grid" class="scroll"></table> 
				<div id="location_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
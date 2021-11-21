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
        	jQuery("#asset_grid").jqGrid({
        	   	url:'AssetsGrid.assets.do',	
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
        	   				'',
        	        	   	'<s:text name="asset.legend.barcode"/>',
        	        	   	'<s:text name="label.person.firstname"/>', 
        	        	   	'<s:text name="asset.legend.department"/>', 
        	        	   	'<s:text name="hum.employee.grid.location"/>',
        	        	   	'<s:text name="asset.label.date.of.purchase"/>',
        	        	   	'<s:text name="dhpet.maint.of.mong.label.quantity"/>', 
        	        	   	'<s:text name="asset.label.purchase.value"/>',
        	        	   	'<s:text name="asset.label.purchase.total"/>',
        	        	   	'<s:text name="asset.label.amortization.grade"/>',
        	        	   	'<s:text name="asset.label.net.after.deval.year"/>',
        	        	   	'<s:text name="asset.label.serial.no"/>',
        	        	   	'<s:text name="asset.label.in.function"/>',
        	        	   	'<s:text name="asset.label.damage"/>',
        	        	   	'<s:text name="report.thinning.grid.label.created.by"/>',
        	        	   	'<s:text name="report.thinning.label.comments"/>'
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'50%'},
        	   		{name:'act',index:'act', width:'50%',search:false},
        	   		{name:'barcode',index:'barcode', width:'100%',search:false},
        	   		{name:'name',index:'name', width:'100%',search:false},
        	   		{name:'organisation',index:'organisation', width:'100%',search:false},
        	   		{name:'location',index:'location', width:'100%', align:"center",search:false},
        	   		{name:'date_of_purchase',index:'date_of_purchase', width:'100%', align:"center",search:false},
        	   		{name:'quantity',index:'quantity', width:'100%', align:"center",hidden:true,search:false},
        	   		{name:'purchase_value',index:'purchase_value', width:'100%',align:"center",search:false},
        	   		{name:'purchase_total',index:'purchase_total', width:'100%',align:"center",search:false},
        	   		{name:'amortization_grade',index:'amortization_grade', width:'100%',align:"center",search:false},
        	   		{name:'net_after_deval_year',index:'net_after_deval_year', width:'100%',align:"center",search:false},
        	   		{name:'serial_no',index:'serial_no', width:'100%',align:"center",search:false},
        	   		{name:'in_function',index:'in_function', width:'100%',align:"center",formatter:"checkbox",search:false},
        	   		{name:'damaged',index:'damaged', width:'100%',align:"center",formatter:"checkbox",search:false},
        	   		{name:'employee',index:'employee', width:'100%',align:"left",search:false,sortable:false},
        	   		{name:'comments',index:'comments', width:'100%',align:"left",search:false,sortable:false},
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#asset_grid_pager',
        	   		gridComplete: function(){
        			var ids = jQuery("#asset_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('Assets','#asset_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#asset_grid").jqGrid('setRowData',ids[i],{act:au});
        			}	
        		},
        	   	sortname: 'a.id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: true,
        		multiboxonly: true,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var selectedRow = jQuery(this).jqGrid('getGridParam','selrow');
    				if(selectedRow){
	    				var rowData = jQuery(this).getRowData(selectedRow); 
	    				var link = "Asset.asset.do?assetId=" + rowData.id;
	 					loadURL(link, $("#assets_content"));
    				}
   				},
   				subGrid: true,
    		    subGridRowExpanded: function(subgrid_id, row_id) {
    		       var subgrid_table_id,pager_id;
    		       subgrid_table_id = subgrid_id+"_t";
    		       pager_id = 'p_'+ subgrid_table_id;
    		       jQuery("#"+subgrid_id).append("<table id='"+subgrid_table_id+"' class='scroll'></table><div id='"+pager_id+"' class='scroll' style='text-align:center;'>");
    		       jQuery("#"+subgrid_table_id).jqGrid({
    		          url:"AssetsGrid.devaluation.do?asset_id="+jQuery("#asset_grid").getRowData(row_id).id,
    		          datatype: "json",
    		          colNames: ['Id',
    		    		          '<s:text name="asset.legend.year.of.devaluation"/>',
    		    		          '<s:text name="asset.label.net.after.deval.year"/>',
    		    		          '<s:text name="finance.payment.created.by"/>',
    		    		          '<s:text name="finance.payment.created.time"/>'
  		    			],
    		          colModel: [
    		            {name:"idDev",index:"idDev",width:'100%',hidden:true},
    		       		{name:"year_of_deval", index:"year_of_deval",width:'100%', align:"center",search:false},
    		            {name:"net_after_deval_year",index:"net_after_deval_year",width:'200%',align:"center",search:false},
    		            {name:"created_by",index:"created_by",width:'100%',align:"center",search:false},           
    		            {name:"created_date",index:"created_date",width:'100%',align:"center",search:false},
    		          ],
    		       	  pager: pager_id,
    		          height: 'auto',
    		          width: 'auto',
    		          rowNum:10,
    	        	  rowList:[10,20,30],
    		      	  viewrecords: true,
    		      	  caption:'<s:text name="label.button.devaluation"/>',
    		          sortname: 'year_of_deval',
    		          sortorder: "asc",
    		          ondblClickRow: function(id, iRow, iCol, e){
           		      },
           		   	  onSelectRow: function(){
						jQuery("#asset_grid").resetSelection();
 	   				  }
    		       });
    		   }       		       		

        	});
              	
        	jQuery("#asset_grid").jqGrid('navGrid','#asset_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        	jQuery("#asset_grid").jqGrid ('navButtonAdd', '#pager', 
                	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
                	onClickButton: function() {
                    	grid.jqGrid('columnChooser');
                	}})
                	.jqGrid('filterToolbar',{searchOperators : true})
                	.navButtonAdd('#asset_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.edit"/>', 
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
             	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
             	   			if(iRow){
             					var rowData = jQuery(this).getRowData(iRow); 
             					var link = "Asset.asset.do?assetId=" + rowData.id;
             					loadURL(link, $("#assets_content"));
             	   			}else{
             	   	   			alert("<s:text name="tender.request.alarm"/>");
             	   	   		}   
             	   	   }, 
             	   	   position:"last"
             	   	})
             	   	.navButtonAdd('#asset_grid_pager',{
             	   	   caption:"",
             	   	   id:"devaluate_button", 
             	   	   title:'<s:text name="asset.legend.assets.devaluate"/>', 
             	   	   buttonicon:"	ui-icon-arrowthickstop-1-n", 
             	   	onClickButton: function(){ 
               			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
               			if(iRow){
               				$("#devaluate_button").addClass('ui-state-disabled');
            				var rowData;
            				var selectedRows=jQuery(this).getGridParam('selarrrow');
    						var selectedId=jQuery(this).getRowData(selectedRows[0]).id;
    						for(var i=1;i<selectedRows.length;i++)
    							{
    								rowData=jQuery(this).getRowData(selectedRows[i]);
    								selectedId=selectedId+","+rowData.id; 
    								
    							}
            				  $( "#assets" ).val(selectedId);
//             				  $("#devaluate").dialog("open");
            				  openDialogForm("assetdevaluation_form_content","AssetsDevaluation.form.do","<s:text name="label.button.devaluation"/>",500,300);
               			}else{
               				alert("<s:text name="tender.request.alarm"/>");
               	   		}   
               	   },  
             	   	   position:"last"
             	   	})
             	   	.navButtonAdd('#asset_grid_pager',{
             	   	   caption:"<s:text name='sub.menu.reports'/>",
             	   	   title:"<s:text name='sub.menu.reports'/>",
             	   	   id:"print_button",
             	   	   buttonicon:"ui-icon-print", 
             	   	   onClickButton: function(){
                 	   	  $("#print_button").addClass('ui-state-disabled');
             	   	      var link="Asset.reportGenerator.do";
             	   	      openDialogForm("report_generator_content",link,"<s:text name="fin.allocation.label.generate.report"/>",600,550);
             	   	   }, 
             	   	   position:"last"
             	   	});
        	

        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_asset_container').width();
            $('#asset_grid').setGridWidth(width);
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
			<input id="assets" value="<s:property value='assets'/>" type="hidden">
			<div id="jqGrid_asset_container">
				<table id="asset_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
				<div id="asset_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
<!-- 			<div id="devaluate"> -->
<%-- 				<jsp:include page="devaluation/assetdevaluation_form.jsp"></jsp:include> --%>
<!-- 			</div> -->
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	

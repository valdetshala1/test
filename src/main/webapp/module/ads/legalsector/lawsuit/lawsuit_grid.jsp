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
        $(document).ready(function () {
        	jQuery("#lawsuit_grid").jqGrid({
        	   	url:'LegalSectorGrid.lawsuit.do',	
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
        	   	colNames:['Id',
        	        	   	'',
        	        	   	'<s:text name="law.suit.label.law.suit.no"/>',
        	        	   	'<s:text name="law.suit.label.claimant"/>',
        	        	   	'<s:text name="law.suit.label.office"/>', 
        	        	   	'<s:text name="law.suit.label.suit.type"/>',
        	        	   	'<s:text name="law.suit.label.date.of.damage"/>',
        	        	   	'<s:text name="law.suit.grid.person"/>',
        	        	   	'<s:text name="law.suit.label.forest.origin"/>',
        	        	   	'<s:text name="law.suit.grid.total.damage"/>',
        	        	   	'<s:text name="law.suit.grid.total.damage.euro"/>',
        	        	   	'<s:text name="hum.employee.label.personal.id"/>',
        	        	   	'<s:text name="finance.contractor.label.address"/>',
        	        	   	'<s:text name="law.suit.label.profession"/>',
        	        	   	'<s:text name="law.suit.label.place.of.employment"/>',
        	        	   	'<s:text name="law.suit.label.accomplice"/>',
        	        	   	'<s:text name="law.suit.label.managment.unit"/>',
        	        	   	'<s:text name="law.suit.label.stand"/>',
        	        	   	'<s:text name="law.suit.label.evidence"/>',
        	        	   	'<s:text name="law.suit.label.place.name"/>'
        	        	   	],
        	   	colModel:[
					{name:'id',index:'id',hidden:true, width:'100%'},
					{name:'act',index:'act', width:'50%',search:false},
        	   		{name:'lawsuit_no',index:'lawsuit_no',width:'100%'},
					{name:'claimant',index:'claimant',width:'100%'},	   	
        	   		{name:'office',index:'office', width:'100%'},
        	   		{name:'suit_type',index :'suit_type', width:'100%', align:"right"},
        	   		{name:'date',index :'date', width:'100%', align:"right"},
        	   		{name:'name',index:'name', width:'100%',align:"right"},
        	   		{name:'origin',index:'origin',width:'100%'},
        	   		{name:'total_damage',index:'total_damage', width:'120%', autowidth: true, align:"right"},		
        	   		{name:'total_damage_euro',index:'total_damage_euro', width:'100%',align:"right"},	
        	   		{name:'personal_id',index:'personal_id',width:'100%'},
        	   		{name:'address',index:'address',width:'100%'},
        	   		{name:'profession',index:'profession',width:'100%'},
        	   		{name:'place_of_employment',index:'place_of_employment',width:'100%'},
        	   		{name:'accomplice',index:'accomplice',width:'100%'},
        	   		{name:'managment_unit',index:'managment_unit',width:'100%'},
        	   		{name:'stand',index:'stand',width:'100%'},
        	   		{name:'evidence',index:'evidence',width:'100%'},
        	   		{name:'placename',index:'placename',width:'100%'}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#lawsuit_grid_pager',
        	   	gridComplete: function(){
        			var ids = jQuery("#lawsuit_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('LawSuit','#lawsuit_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#lawsuit_grid").jqGrid('setRowData',ids[i],{act:au});
        			}	
        		},
        	   	sortname: 'ls.id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>', 
        		ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "LawSuit.form.do?lawsuitId=" + rowData.id;
    				loadURL(link, $("#lawsuit_form_content")); 
   				} 
        	});
        	$("#lawsuit_grid")
           	.navGrid('#lawsuit_grid_pager',{edit:false,add:false,del:false,search:false})
           	.navButtonAdd('#lawsuit_grid_pager',{
           	   caption:"", 
           	   title:"<s:text name="label.button.edit"/>",  
           	   buttonicon:"ui-icon-pencil", 
           	   onClickButton: function(){ 
           			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
           			if(iRow){
        				var rowData = jQuery(this).getRowData(iRow); 
        				var link = "LawSuit.form.do?lawsuitId=" + rowData.id;
        				loadURL(link, $("#lawsuit_form_content"));
           			}else{
           	   			alert("<s:text name="global.please.select.row"/>");
           	   		}   
           	   }, 
           	   position:"last"
           	})
           	.navButtonAdd('#lawsuit_grid_pager',{
         	   	   caption:"", 
         	   	   title:"<s:text name="law.suit.legend.law.suit.status"/>",
         	   	   buttonicon:"ui-icon-shuffle",
         	   	   id:"suit_status", 
         	   	   onClickButton: function(){ 
         	   		var iRow = jQuery(this).jqGrid('getGridParam','selrow');
           			if(iRow){
           				$("#suit_status").addClass("ui-state-disabled");
           				var rowData = jQuery(this).getRowData(iRow); 
           				var link="LawSuitStatus.page.do?lawSuitId="+rowData.id;
           				openDialogForm('law_suit_status_content',link,"<s:text name="law.suit.legend.law.suit.status"/>",900,700);
           			}else{
           	   			alert("<s:text name="global.please.select.row"/>"); 
           	   			} 
         	   		
           	   		},  
         	   	   position:"last"
         	   	})
         	 	.navButtonAdd('#lawsuit_grid_pager',{
	             	   caption:"<s:text name='sub.menu.reports'/>",
	              	   title:"<s:text name='sub.menu.reports'/>", 
        		   	   buttonicon: "ui-icon-print",
        		   	   id:"law_print", 
        		   	   onClickButton: function(){ 
        		   			$("#law_print").addClass("ui-state-disabled");
        			   		var link = "LawSuit.reportGenerator.do";
        			   		openDialogForm('lawsuitReportGen',link,'<s:text name="label.button.generate.report"/>',800,420);
        		   	   }, 
        		   	   position:"last"
        	   	});
         	   	
         	   	
        });
        $(window).bind('resize', function() {
            var width = $('#jqGrid_lawsuit_container').width();
            $('#lawsuit_grid').setGridWidth(width);
        });
//         $("#lawsuit_grid").jqGrid('navGrid','#lawsuit_grid_pager',{},{width:1000});
             
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
			<div id="jqGrid_lawsuit_container">
				<table id="lawsuit_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
				<div id="lawsuit_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->
		<!-- start add Damage detail -->
			<!-- end add Damage detail -->

 </body>   
			
</html>	

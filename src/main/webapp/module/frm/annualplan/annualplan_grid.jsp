<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript">


var	municipality = function (elem) {
		$(elem).autocomplete({
	        source: function(request, response) {
	            $.ajax({
	            	type:"get",
	                url: "Input.municipality.do",
	                dataType: "json",
	                data: {
						featureClass: "P",
						style: "full",
						maxRows: 12,
						name_startsWith: request.term,
						orgtype: "D"
					},
					success: function( data ) {
						response( $.map( data, function(item ) {
							return {
								label: item.name,
	                            value: item.name,
	                            id: item.id
							};
						}));
					},
	                maxRows: 100,
	        		minLength: 0   
	            });
	        },
	        select: function(event, ui) {
	            $(elem).val(ui.item.value);
			     var grid = $("#annualplan_grid");
			     grid.jqGrid({
			         search:true, // if you want to force the searching
			         postData: { mun_id: ui.item.id}
			     });	     
			     $.extend(grid[0].p.postData,{mun_id: ui.item.id});
			     grid.trigger("reloadGrid",[{page:1}]);            
	        }  
	    });
	};
    initDateEdit = function (elem) {
        setTimeout(function () {
            $(elem).datepicker({
                dateFormat: "dd-M-yy",
                autoSize: true,
                //showOn: "button", // it dosn't work in searching dialog
                changeYear: true,
                changeMonth: true,
                showButtonPanel: true,
                showWeek: true
            });
        }, 100);
    };
    
    initDateSearch = function (elem) {
        setTimeout(function () {
            $(elem).datepicker({
                dateFormat: "dd-M-yy",
                autoSize: true,
                changeYear: true,
                changeMonth: true,
                showWeek: true,
                showButtonPanel: true
            });
        }, 100);
    };
       
    var comp_id;
        $(document).ready(function () {
            $("#status_icon").hide();
            var oplVal='<s:property value="user.getOrganisation().getOperLevelVal()"/>';
            var fiu='<s:property value="isForestInstituteUser()"/>';
        	jQuery("#annualplan_grid").jqGrid({
        	   	url:'FrmGrid.annualPlanning.do',	
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
        		regional : 'en',
        		shrinkToFit: true,
        		gridview: true,
                headertitles: true,
                viewrecords: true,
                rownumbers: true,
        	   	colNames:[ 'Id',
        	        	    '<s:text name="law.suit.label.status"/>',
        	   	            '<s:text name="annual.plan.municipality.id"/>',
        	   	            '<s:text name="annual.plan.municipality"/>',
        	   	        	'<s:text name="annual.plan.year"/>',
        	   	        	'<s:text name="ann.plan.created.by.id"/>', 
        	   	        	'<s:text name="annual.plan.created.by"/>',
        	   	        	'<s:text name="annual.plan.remarks"/>',
        	   	        	'<s:text name="annual.plan.status.remarks"/>',
        	   	  			'<s:text name="annual.plan.status.code"/>',
        	   				'<s:text name="annual.plan.status"/>',
        	   				'<s:text name="annual.plan.status.id"/>',
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'50%'},
        	   		{name:'status_icon',index:'status_icon', width:'100%', sortable:true, align:"left", editable:false, frozen:true, search:true, stype:'select', 
        	   			searchoptions:{sopt:['eq','ne'], value: ':;NEW:<s:text name="home.statistic.status.request.new"/>;SUB:<s:text name="home.statistic.status.request.submitted"/>;APR:<s:text name="home.statistic.status.request.approved"/>'}
                	},
        	   		{name:'mun_id',index:'mun_id', hidden:true, width:'100%',align:"right"},
        	   		{name:'mun_name',index:'mun_name', width:'100%',align:"right", sorttype:'string',search:true,
            	   		searchoptions:{
            	   			sopt:['eq','bw','bn','cn','nc','ew','en'],
            	   			dataInit: municipality
                       }
        	   		},
        	   		
        	   		{name:'year',index:'year',  search:true,width:'100%',align:"right", sorttype:'number'},
        	   		/*
                    { name: "year", index: "year", width: 80, align: "center", sorttype: "date",
                        formatter: "date", formatoptions: { newformat: "d-M-Y" }, editable: true, datefmt: "d-M-Y",
                        editoptions: { dataInit: initDateEdit },
                        searchoptions: { sopt: ["eq", "ne", "lt", "le", "gt", "ge"], dataInit: initDateSearch } },
                    */            	   		
        	   		{name:'created_by_id',index:'created_by_id', hidden:true, width:'100%',align:"right", search:false},
        	   		{name:'created_by',index:'created_by', hidden:false, width:'100%',align:"right", search:false},
        	   		{name:'remarks',index:'remarks', hidden:false, width:'100%',align:"right", search:false},
        	   		{name:'status_remarks',index:'status_remarks', width:'100%',align:"right", search:false},
        	   		{name:'status',index:'status', hidden:false, width:'100%',align:"right",hidden: true,  search:false},
        	   		{name:'status_id',index:'status_id', hidden:true, width:'100%',align:"right", search:false},
        	   		{name:'status_code',index:'status_code', hidden:true, width:'100%',align:"right", search:false}
        	   		],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#annualplan_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: true,
        		multiboxonly:true,
        		caption: "<s:text name="annual.plan.menu"/>", 
        		loadtext:'<s:text name="grid.loading.text"/>', 
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery("#annualplan_grid").getRowData(iRow); 
    				var link = "Annualplan.form.do?annualplanId=" + rowData.id;
    				loadURL(link, $("#annualplan_form_content"));
   				},
   				onSelectRow: function(ids) {
   					var selectedRow = jQuery("#annualplan_grid").jqGrid('getGridParam','selrow');
   					var rowData = jQuery(this).getRowData(selectedRow);
   					if(((!rowData.mun_id && fiu=='true') || oplVal=='R') && (rowData.status=='NEW' || rowData.status=='REPLANNED')){
   						$("#submitButton").show();
   	   				}else{
   	   					$("#submitButton").hide();
   	   				}
				}

        	});
        	
        	jQuery("#annualplan_grid").jqGrid('filterToolbar',{searchOperators : true});
        	jQuery("#annualplan_grid").jqGrid('filterToolbar',{searchOperators : true});
        	 //$.jgrid.setRegional('annualplan_grid',{regional: 'en'});
//         	function navigateToLang(lng) {
	     		// var appLang='<s:property value="locale.getLanguage()"/>';
        	
//         	}
        	//$.jgrid.setRegional('annualplan_grid',{regional: appLang});
        //	$("#annualplan_grid").jqGrid({ regional : 'en'});
        
//         	$.jgrid.regional["en"] = {
// 				defaults : {
// 					recordtext: "Shfaq {0} - {1}/{2}",
// 					refreshtitle: "Rifreskimi"
// 				}
// 			};

        	jQuery("#annualplan_grid").jqGrid('navGrid','#annualplan_grid_pager',
                	{edit: false, add:false, search:false, del:false, refresh:true, view:true},
        			{}, {},{},{multipleSearch:true,recreateFilter:true})
        	 	.navButtonAdd('#annualplan_grid_pager',{
		   	   caption:"", 
		   	   title:"<s:text name="label.button.edit"/>", 
		   	   buttonicon:"ui-icon-pencil", 
		   	   onClickButton: function(){ 
		   			var iRow = jQuery("#annualplan_grid").jqGrid('getGridParam','selrow');
		   			if(iRow){
		   				var rowData = jQuery("#annualplan_grid").getRowData(iRow); 
		 		  	 	var link = "Annualplan.form.do?annualplanId="+rowData.id ;
							openDialogForm('annual_plan_create_content',link,"<s:text name="annual.plan.form"/> ",800,420);
					
	    				loadURL(link, $("#annualplan_form_content"));
		   			}else{
		   	   			alert("<s:text name="global.please.select.row"/>"); 
		   	   		}   
		   	   }, 
		   	   position:"last"
		   	})  
		   	.navButtonAdd('#annualplan_grid_pager',{
		   	   caption:"",
		   	   title:"<s:text name="label.button.start.planning"/>",  
		   	   buttonicon: "ui-icon-gear", 
		   	   onClickButton: function(){ 
		   		var iRow = jQuery("#annualplan_grid").jqGrid('getGridParam','selrow');
					if(iRow){
						var rowData = jQuery("#annualplan_grid").getRowData(iRow); 
						var link = "Annualplan.board.do?annualplanId=" + rowData.id;
						loadURL(link, $("#annualplan_content"));
						$("#status_icon").append(rowData.status_icon);

						var link2 = "Annualplan.form.do?";// on creating activity clear annual plan form
	    				loadURL(link2, $("#annualplan_form_content"));
					}else{
			   			alert("<s:text name="global.please.select.row"/>"); 
			   		} 
		   		
		   	   }, 
		   	   position:"last"
	   	});
        	if(oplVal=='C' && fiu=='false'){
        		jQuery("#annualplan_grid").navButtonAdd('#annualplan_grid_pager',{
		   	   caption:"",
		   	   title:"<s:text name="law.suit.label.status"/>",  
		   	   buttonicon: "ui-icon-shuffle", 
		   	   onClickButton: function(){ 
		   		var iRow = jQuery("#annualplan_grid").jqGrid('getGridParam','selrow');
					if(iRow){
						var rowData = jQuery("#annualplan_grid").getRowData(iRow);
						var s=rowData.status;
						if(s=='SUBMITTED' || s=='REPLANNED'){
							var link = "Annualplan.statusPopup.do?annualplanId="+rowData.id ;
							openDialogForm('annual_plan_status_content',link,"<s:text name="annual.plan.annual.plan.submit"/>",800,420);
						}else{
							alert("<s:text name='annual.plan.no.status.change.stage'/>");
						}
					}else{
			   			alert("<s:text name="global.please.select.row"/>"); 
			   		} 
		   		
		   	   }, 
		   	   position:"last"
	   	});}
       	 if(oplVal!='M'){
		    	jQuery("#annualplan_grid").navButtonAdd('#annualplan_grid_pager',{
		 		   	   caption:"",
		 		   	   title:"<s:text name="annual.plan.form"/>",  
		 		   	   buttonicon: "ui-icon-plusthick", 
		 		   	   onClickButton: function(){ 
		 		   		var iRow = jQuery("#annualplan_grid").jqGrid('getGridParam','selrow');
		 		  	 	/*  if(iRow){
		 		  	 	var rowData = jQuery("#annualplan_grid").getRowData(iRow); 
		 		  	 	var link = "Annualplan.form.do?annualplanId="+rowData.id ;
							openDialogForm('annual_plan_create_content',link,"<s:text name="annual.plan.form"/> ",800,420);
			 		  	 	}else{  */
			 		  			var link = "Annualplan.form.do";
	 							openDialogForm('annual_plan_create_content',link,"<s:text name="annual.plan.form"/>",800,420);
				 		  	 	/* } */
		 		   	   },  
		 		   	   position:"last"
		 	   	});
			}
        	jQuery("#annualplan_grid").navButtonAdd('#annualplan_grid_pager',{
		   	   caption:"",
		   	   id:"submitButton",
		   	   title:"<s:text name="frm.private.plan.submit"/>", 
		   	   buttonicon: "ui-icon-transferthick-e-w", 
		   	   onClickButton: function(){ 
		   		var iRow = jQuery("#annualplan_grid").jqGrid('getGridParam','selrow');
					if(iRow){
						var rowData = jQuery("#annualplan_grid").getRowData(iRow); 
						var s=rowData.status;
						if(s=='NEW' || s=='REPLANNED'){
							var link = "Annualplan.submitPopup.do?annualplanId="+rowData.id ;
							openDialogForm('annual_plan_submit_content',link,"<s:text name="annual.plan.annual.plan.status"/>",800,420);
							
						}else{
							alert("<s:text name='annual.plan.no.status.change.stage'/>");
							}
					}else{
			   			alert("<s:text name="global.please.select.row"/>"); 
			   		} 
		   		
		   	   }, 
		   	   position:"last"
		   	});
		$("#submitButton").hide();
 		jQuery("#annualplan_grid").navButtonAdd('#annualplan_grid_pager',{
		   	   caption:"<s:text name="label.button.report"/>",
		   	   title:"<s:text name="label.button.report.generator"/>", 
		   	   buttonicon: "ui-icon-print",
		   	   id:"annu_report_button", 
		   	   onClickButton: function(){
			   	   $("#annu_report_button").addClass("ui-state-disabled");
			   		var link = "Annualplan.reportGenerator.do?";
			   		openDialogForm('report_generator_content',link,"<s:text name="label.button.report.generator"/>",800,420);
		   	   }, 
		   	   position:"last"
	   	});

//  		$("#annualplan_grid").jqGrid({regional : 'al'});

			
        $(window).bind('resize', function() {
            var width = $('#jqGrid_comp_container').width();
            $('#annualplan_grid').setGridWidth(width);
            $('#stand_grid').setGridWidth(width);
        });
            
    });  
  
</script>
    
</head>
<body>
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">

			<div id="jqGrid_comp_container">
				<table id="annualplan_grid" class="scroll"></table> 
				<div id="annualplan_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			<input id="compId" value="<s:property value='compId'/>" type="hidden">
		</div>
		<!-- end widget div -->
		<div id="status_icon">
		
		</div>

 </body>   
			
</html>	

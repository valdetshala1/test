<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
ui-grid{ width:100% !important; }
.myAltRowClass { background-color: #DCFFFF; background-image: none; }
</style>
        <script type="text/javascript">
        $(document).ready(function () {

            getColumnIndexByName = function(mygrid,columnName) {
                var cm = mygrid.jqGrid('getGridParam','colModel');
                for (var i=0,l=cm.length; i<l; i++) {
                    if (cm[i].name===columnName) {
                        return i; // return the index
                    }
                }
                return -1;
            };
        	  
        	igrid = jQuery("#fiskos_import_grid").jqGrid({ 
            	url:'DemGrid.fiskosImport.do', 
            	datatype: "json", 
        		jsonReader : {
     			      root:"rows",
     			      page: "page",
     			      total: "total",
     			      records: "records",
     			      repeatitems: false,
     			      id: "0"
          		},            	
            	colNames:['Id', 
            	        '<s:text name="dem.fiskos.trnx.id"/>',
                      	'<s:text name="dem.fiskos.version.nr"/>', 
                      	'<s:text name="dem.fiskos.is.active"/>', 
                      	'<s:text name="frm.compartment.region.name"/>', 
                      	'<s:text name="frm.compartment.mgmt.unit"/>',
                      	'<s:text name="dem.fiskos.start.date"/>',
                      	'<s:text name="dem.fiskos.end.date"/>',
                      	'<s:text name="bid.grid.created.by"/>',
                      	'<s:text name="bid.grid.created.date"/>', 
                      	'<s:text name="dem.fiskos.changed.by"/>',
                      	'<s:text name="dem.fiskos.changed.date"/>', 
                      	'<s:text name="leave.ent.label.note"/>', 
                      	'<s:text name="dem.fiskos.reg.id"/>', 
                      	'<s:text name="annual.plan.municipality.id"/>'
                      	], 
            	colModel:[ 
                      	{name:'id',index:'id', width:20, align:"center"},
                      	{name:'trnx_id',index:'trnx_id', width:150, align:"center"},  
                      	{name:'version_nr',index:'version_nr', width:50, align:"center"},
                      	{name:'isactive',index:'isactive', width:60, align:"center"},
                      	{name:'region',index:'region', width:90},  
                      	{name:'mu',index:'mu', width:90},
                      	{name:'start_date',index:'start_date', width:80, align:"center"}, 
                      	{name:'end_date',index:'end_date', width:80, align:"center"}, 
                       	{name:'created_by',index:'created_by', width:80}, 
                       	{name:'created_date',index:'created_date', width:80,align:"center"},
                       	{name:'changed_by',index:'changed_by', width:80}, 
                       	{name:'changed_date',index:'changed_date', width:80,align:"center"}, 
                       	{name:'note',index:'note', width:150, sortable:false}, 
                       	{name:'region_id',index:'region_id', hidden:true, width:100}, 
                       	{name:'mu_id',index:'mu_id', hidden:true, width:80}
                       ], 
                 rowNum:10, 
                 rowList:[10,20,30], 
                 pager: '#fiskos_import_pager', 
                 sortname: 'created_date', 
         		height: '100%',
        		width: '100%',
        		autowidth: true,
        		shrinkToFit: false,
        		gridview: true,
                headertitles: true,
                viewrecords: true,
                rownumbers: true,                 
                viewrecords: true, 
                sortorder: "desc", 
                multiselect: false, 
                caption: "<s:text name="dem.fiskos.import.header"/>", 
                onSelectRow: function(ids) { 
                   	if(ids == null) { 
                        ids=0; 
                        if(jQuery("#fiskos_data_grid").jqGrid('getGridParam','records') >0 ) { 
                            $("#fiskos_data_grid").jqGrid('setGridParam',{postData: { import_id : ids }, search:true });
                            $("#fiskos_data_grid").jqGrid('setCaption',"<s:text name='dem.fiskos.import.detail'/>: " + ids).trigger("reloadGrid");
                        }	
                   	}else{ 
                   		var rowData = jQuery(this).getRowData(ids);
                        $("#fiskos_data_grid").jqGrid('setGridParam',{postData: { import_id : rowData.id }, search:true });
                        $("#fiskos_data_grid").jqGrid('setCaption',"<s:text name='dem.fiskos.import.detail'/>: " + rowData['region'] + " - " + rowData['mu']).trigger("reloadGrid");
                   } 
                 },                  
                 loadComplete: function() {
					 /*
                	 igrid.jqGrid('setCell',"12","name","",{color:'red'});
                	 igrid.jqGrid('setCell',"10",'name', '', 'my-highlight');
                	 igrid.jqGrid('setCell',"8",'name', '', 'ui-state-error ui-state-error-text');

                	 igrid.jqGrid('setCell',"4","name","",{'background-color':'yellow', 'background-image':'none'});
                	 igrid.jqGrid('setCell',"3","name","",'ui-state-highlight');
                	 */

                	 var rowIDs = igrid.getDataIDs();  
                	 for (var i = 0; i < rowIDs.length; i++) {
                	     var rowData = igrid.jqGrid('getRowData', rowIDs[i]);   
                	     if (rowData["isactive"] == "N") {          
                	         igrid.jqGrid('setCell', rowIDs[i], "id", "", { 'background-color':'red' });
                	    	 igrid.jqGrid('setCell', rowIDs[i], "isactive", "", { 'color':'red' });
                	     }else if (rowData["isactive"] == "Y") {
                	    	 igrid.jqGrid('setCell', rowIDs[i], "id", "", { 'background-color':'green' });
                	    	 igrid.jqGrid('setCell', rowIDs[i], "isactive", "", { 'color':'green' });
                	     }
                	 }
                 }                 
                 
            	});      

//         	igrid.navGrid('#fiskos_import_grid_pager', {refresh:true,edit:false,add:false,del:false,search:false});
        	igrid.jqGrid('navGrid','#fiskos_import_pager',
                	{edit: false, add:false, del:false,search:false, refresh:true, view:false},
        			{}, {},{},{multipleSearch:false,recreateFilter:true});        	
            
        	jQuery("#fiskos_data_grid").jqGrid({
        	   	url:'DemGrid.fiskosData.do',	
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
        	        	   	'<s:text name="law.suit.label.managment.unit"/>', 
        	        	   	'<s:text name="annual.plan.municipality.id"/>', 
        	        	   	'<s:text name="dem.fiskos.managment.class.id"/>', 
        	        	   	'<s:text name="law.suit.label.active"/>', 
        	        	   	'<s:text name="dem.fiskos.version.nr"/>', 
        	        	   	'<s:text name="dem.fiskos.modyfied.data"/>', 
        	        	   	'<s:text name="dem.fiskos.imported.by"/>', 
							'<s:text name="dem.fiskos.imported.data"/>', 
							'<s:text name="hum.employee.label.notes"/>', 
							'<s:text name="frm.compartment.region.name"/>', 
							'<s:text name="law.suit.label.managment.unit"/>', 
							'<s:text name="annu.felling.label.municipality"/>', 
							'<s:text name="frm.stand.compartment"/>', 
							'<s:text name="frm.stand.stand"/>', 
							'<s:text name="dem.fiskos.stand.area"/>', 
							'<s:text name="dem.fiskos.managment.class.id"/>', 
							'<s:text name="dem.fiskos.plots.nr"/>', 
							'<s:text name="dem.fiskos.accessible"/>', 
							'Minehazard', 
							'<s:text name="dem.fiskos.layers"/>', 
							'<s:text name="frm.stand.stand.type"/>', 
							'<s:text name="frm.stand.crowncover"/>', 
							'<s:text name="frm.stand.slope"/>', 
							'<s:text name="frm.stand.litter.cov"/>', 
							'<s:text name="frm.stand.age"/>', 
							'<s:text name="frm.stand.origin"/>', 
							'<s:text name="frm.stand.conifer"/>', 
							'<s:text name="frm.stand.conifer.bon"/>', 
							'<s:text name="frm.stand.decidouse"/>', 
							'<s:text name="frm.stand.decidouse.bon"/>', 
							'<s:text name="frm.stand.trees"/>', 
							'<s:text name="frm.stand.volume.m3.ha"/>', 
							'<s:text name="frm.stand.confer.perc"/>', 
							'<s:text name="frm.stand.decidouse.perc"/>', 
							'<s:text name="frm.stand.perc03"/>' 
      	        	   	],
        	   	colModel:[
					{name:'id', index:'id', hidden:true, width:'100%', align:"center"},	   	
        	   		{name:'mu_id', index:'mu_id', width:'100%'},
        	   		{name:'mun_id', index:'mun_id', width:'100%', align:"center"},
        	   		{name:'mngm_class_id', index :'mngm_class_id', width:'100%'},
        	   		{name:'active', index:'active', width:'100%', align:"center"},		
        	   		{name:'version_nr', index:'version_nr', width:'100%', align:"center"},
        	   		{name:'modyfied_date', index :'modyfied_date', width:'100%', align:"center"},
        	   		{name:'imported_by', index:'imported_by', width:'100%'},		
        	   		{name:'imported_date', index:'imported_date', width:'100%', align:"center"},
        	   		{name:'notes', index:'notes', width:'100%'},
        	   		{name:'region', index:'region', width:'100%'},
        	   		{name:'managment_unit', index:'managment_unit', width:'100%'},
        	   		{name:'municipality', index:'municipality', width:'100%'},
        	   		{name:'comp', index:'comp', width:'100%'},
        	   		{name:'stand', index:'stand', width:'100%'},
        	   		{name:'standarea', index:'standarea', width:'100%'},
        	   		{name:'mngmntclas_id', index:'mngmntclas_id', width:'100%'},
        	   		{name:'plots_nr', index:'plots_nr', width:'100%'},
        	   		{name:'accessible', index:'accessible', width:'100%'},
        	   		{name:'minehazard', index:'minehazard', width:'100%'},
        	   		{name:'layers', index:'layers', width:'100%'},
        	   		{name:'stand_type', index:'stand_type', width:'100%'},
        	   		{name:'slope', index:'slope', width:'100%'},	
        	   		{name:'littercov', index:'littercov', width:'100%'},
        	   		{name:'crowncover', index:'crowncover', width:'100%'},
        	   		{name:'age', index:'age', width:'100%'},
        	   		{name:'origin', index:'origin', width:'100%'},
        	   		{name:'crowncover', index:'crowncover', width:'100%'},
        	   		{name:'conifer', index:'conifer', width:'100%'},
        	   		{name:'conifer_bon', index:'conifer_bon', width:'100%'},
        	   		{name:'decidouse', index:'decidouse', width:'100%'},
        	   		{name:'decidouse_bon', index:'decidouse_bon', width:'100%'},
        	   		{name:'trees', index:'trees', width:'100%'},
        	   		{name:'volume_m3ha', index:'volume_m3ha', width:'100%'},
        	   		{name:'conifer_perc', index:'conifer_perc', width:'100%'},
        	   		{name:'decidouse_perc', conifer_perc:'decidouse_perc', width:'100%'}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#fiskos_data_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>', 
        		ondblClickRow: function(id, iRow, iCol, e) {
//     				var rowData = jQuery(this).getRowData(iRow); 
//     				var link = "Person.form.do?personId=" + rowData.id;
//     				loadURL(link, $("#person_form_content")); 				
   				} 

        	});
              	
        	$("#fiskos_data_grid").navGrid('#fiskos_data_grid_pager',{edit:false,add:false,del:false,search:false});
//            	.navButtonAdd('#fiskos_data_grid_pager',{
//            	   caption:"", 
//            	   title:"<s:text name="label.button.edit"/>", 
//            	   buttonicon:"ui-icon-pencil", 
//            	   onClickButton: function(){ 
//            			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
//            			if(iRow){
//         				var rowData = jQuery(this).getRowData(iRow); 
//         				var link = "Person.form.do?personId=" + rowData.id;
//         				loadURL(link, $("#person_form_content"));
//            			}else{
//            	   			alert("<s:text name="global.please.select.row"/>"); 
//            	   		}   
//            	   }, 
//            	   position:"last"
//            	})
        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_fiskos_container').width();
            $('#fiskos_import_grid').setGridWidth(width);
            $('#fiskos_data_grid').setGridWidth(width);
        });
    </script>
    
</head>
<body>
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">
			<div id="jqGrid_fiskos_container">
				<div>
					<table id="fiskos_import_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
					<div id="fiskos_import_pager" class="scroll" style="text-align:center;"></div>
				</div>				
				</br>
				<div>			
				<table id="fiskos_data_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
				<div id="fiskos_data_grid_pager" class="scroll" style="text-align:center;"></div>
				</div>
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	

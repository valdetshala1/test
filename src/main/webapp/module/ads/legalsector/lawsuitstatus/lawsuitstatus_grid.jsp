<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <script type="text/javascript">
   $(document).ready(function () {

	   var success=new Array();
       success[0]='<s:text name="tender.request.document.success"/>';
       success[1]='<s:text name="small.box.content"/>';
       var fail=new Array();
       fail[0]='<s:text name="tender.request.document.failed"/>';
       fail[1]='<s:text name="tender.request.no.document.exists"/>';
       
   	jQuery("#lawsuitstatus_grid").jqGrid({
   		url:'LegalSectorGrid.lawsuitstatus.do?lawsuitId='+$('#lawSuitId').val(),
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
                  '<s:text name="law.suit.label.status"/>', 
                  '<s:text name="law.suit.label.court.session.date"/>', 
                  '<s:text name="hum.employee.label.file.name"/>',
                  '<s:text name="law.suit.label.active"/>',
                  '<s:text name="report.thinning.grid.label.created.by"/>',
                  '<s:text name="report.damage.grid.label.created.date"/>',
                  '<s:text name="annual.plan.remarks"/>',
                  '<s:text name="hrm.skill.label.attachment"/>',
                  '<s:text name="hum.employee.label.documents"/>' 
                ],
	   	colModel:[
			{name:'id',index:'id',hidden:true, width:'100%'},	   	
	   		{name:'status',index:'status', width:'100%'},
	   		{name:'courtSessionDate',index:'courtSessionDate', width:'100%'},
	   		{name:'fileName',index :'fileName', width:'100%'},
	   		{name:'active',index:'active', align:'center',width:'100%' ,formatter:"checkbox"},
	   		{name:'createby',index:'createby', width:'100%'},
	   		{name:'createdate',index :'createdate', width:'100%'},
	   		{name:'note',index:'note', width:'100%'},
	   		{name: "generate", index: "generate",sortable:false, align:"center",search:false, width:'100%'},
	   		{name:'doc',index:'doc', width:'0%',hidden:true}
	   	],
   	   	rowNum:10,
   	   	rowList:[10,20,30],
   	   	pager: '#lawsuitstatus_grid_pager',
        sortname: 'id',
        sortorder: "desc",
        sorttype: "text",
        scrolloffset: 0,
        sortable: true,
   	    viewrecords: true,
   	 	multiboxonly: true,
   		multiselect: false,
   		caption: "",
   		loadtext:'<s:text name="grid.loading.text"/>', 
   		loadComplete: function(data){
        },
		ondblClickRow: function(id, iRow, iCol, e) {
			var rowData = jQuery(this).getRowData(iRow); 
			var link = "LawSuitStatus.form.do?lawSuitStatusId=" + rowData.id;
			loadURL(link, $("#lawsuitstatus_form_content"));
		},
   		gridComplete: function(){
	       		var ids = jQuery(this).jqGrid('getDataIDs');
				for(var i=0;i < ids.length;i++){
					var doc = $(this).getCell(ids[i],"doc");
		        if(doc == "true") {
		        	var url="LawSuitDoc.do?attachmentId="+jQuery("#lawsuitstatus_grid").jqGrid().getRowData(ids[i]).id;
		        	be = "<button class='btn btn-xs btn-default' data-original-title='Attachment' onclick=\"generateAttachment('"+url+"');\"><i class='fa fa-paperclip'></i></button>";
   					jQuery(this).jqGrid('setRowData',ids[i],{generate:be});
		        }
		        var activeStatus=jQuery("#lawsuitstatus_grid").jqGrid().getRowData(ids[i]).active;
		        if(activeStatus=='Yes')
		        {
		            $("#lawsuitstatus_grid").jqGrid('setRowData',ids[i],false, {color:'white',weightfont:'bold',background:'#cde0c4'});            
		        }
				}
		

				
			}        		
   	});

   	$("#lawsuitstatus_grid")
   	.navGrid('#lawsuitstatus_grid_pager',{edit:false,add:false,del:false,search:false})
   	.navButtonAdd('#lawsuitstatus_grid_pager',{
   	   caption:"", 
   	   title:"<s:text name="label.button.edit"/>",  
   	   buttonicon:"ui-icon-pencil", 
   	   onClickButton: function(){ 
   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
   			if(iRow){
				var rowData = jQuery(this).getRowData(iRow); 
				var link = "LawSuitStatus.form.do?lawSuitStatusId=" + rowData.id;
				loadURL(link, $("#lawsuitstatus_form_content"));	  
   			}else{
   	   			alert("<s:text name="global.please.select.row"/>"); 
   	   		}   
   	   }, 
   	   position:"last"
   	})
	   	
   }); 
   
   $(window).bind('resize', function() {
      var width = $('#jqGrid_lss_container').width();
      $("#lawsuitstatus_grid").jqGrid('setGridWidth',width);
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
		<!-- widget div -->
		<div style="margin-bottom: 1.0em;">
			
			<div id="jqGrid_lss_container">
				
				<table id="lawsuitstatus_grid" class="scroll"></table>
				<div id="lawsuitstatus_grid_pager"></div>
	
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	

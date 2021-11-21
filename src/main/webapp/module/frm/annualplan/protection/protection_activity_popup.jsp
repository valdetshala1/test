<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<html>
<head>

</head>

<body>
<!-- widget div-->
<div id="silvi_activity_popup_content">

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
		<form id="silvi_activity_popup_form" class="form-horizontal" accept-charset="utf8" method="post">
			<input id="activitySelectedId"  name="activitySelectedId"  type="hidden" />
			<input id="activitySelectedText"  name="activitySelectedText"  type="hidden" />
			
			<div class="form-group">
			<div id="using_json_2" class="demo">
			</div>	
			</div>	
			 <footer class="form-actions">
					<button id="saveActivity" class="btn btn-primary" type="button">
						<i class="fa fa-save"></i>
						<s:text name="label.button.save"></s:text>
					</button>
					<button id="cancelActivity" class="btn btn-default" type="button">
						<s:text name="label.button.cancel"></s:text>
					</button>
			</footer>
			
			<div id="using_json_2" class="demo">
			</div>
		
		
		</form>
	</div>
	<!-- end widget content -->
</div>
<!-- end widget div -->


<script type="text/javascript">
	$(document).ready(function () {

	    $("#saveActivity").on('click', function() {
			$("#activity\\.activityDomain\\.id").val($("#activitySelectedId").val());
			$("#activity\\.activityDomain\\.name").val($("#activitySelectedText").val());
			$("#silvi_activity_popup_content").dialog("close");  			
		});

		
		/*
 		var data = '{"key":25,"title":"perpunim i tokes", "id":"25", "isFolder": "true", "checkbox":"false", "children":[{"key":26, "title":"my test", "isFolder": "false", "checkbox":"true", "children":[]}]}';
		//var obj = $.parseJSON(data);
		var obj = JSON.parse(data);
		console.log(obj);
	
		 $("#treedomain").dynatree({
		      checkbox: true,
			  selectMode : 1,
			  imagePath: "/css/tree/skin/",		 
		      children: obj,
		      onSelect: function(select, node) {
		        // Display list of selected nodes
		        var selNodes = node.tree.getSelectedNodes();
		        // convert to title/key array
		        var selKeys = $.map(selNodes, function(node){
		             return "[" + node.data.key + "]: '" + node.data.title + "'";
		        });
		        console.log( node.data.key + ", title:" + node.data.title + ", id:" + node.data.id);
		        
		      },
		      onClick: function(node, event) {
		        // We should not toggle, if target was "checkbox", because this
		        // would result in double-toggle (i.e. no toggle)
		        if( node.getEventTargetType(event) == "title" )
		          node.toggleSelect();
		      },
		      onKeydown: function(node, event) {
		        if( event.which == 32 ) {
		          node.toggleSelect();
		          return false;
		        }
		      },
		      // The following options are only required, if we have more than one tree on one page:
		      cookieId: "dynatree-Cb2",
		      idPrefix: "dynatree-Cb2-"
		    });
			*/

// 		 $("#treedomain").dynatree({
// 			 	initAjax: { 
// 				 		  url: 'FrmGrid.domainTreeJSON.do',
// 				 		  dataType: "json",
// 						  success: function(node) {
// 				               // Called after nodes have been created and the waiting icon was removed.
// 				               // 'this' is the options for this Ajax request
// 				               console.log("success:" + node.data);
// 				               },
// 				           error: function(node, XMLHttpRequest, textStatus, errorThrown) {
// 				               // Called on error, after error icon was created.
// 				               },
// 				           cache: false // Append random '_' argument to url to prevent caching.
				          
			
// 	               },
// 	               //postProcess: null, // Callback(data, dataType) before an Ajax result is passed to dynatree.
// 	              postProcess: function(data, dataType) {
// 	            	  //var obj = JSON.parse(data);
// 	            	  //console.log("postProcess:" + obj);
// 	            	  //traves over json data - over tree
// 	            	  return data;
// 	              },     
// 	 		      onSelect: function(select, node) {
// 	 			        // Display list of selected nodes
// 	 			        var selNodes = node.tree.getSelectedNodes();
// 	 			        // convert to title/key array
// 	 			        var selKeys = $.map(selNodes, function(node){
// 	 			             return "[" + node.data.key + "]: '" + node.data.title + "'";
	 			           
	 			             
// 	 			        });
// // 	 			        console.log( node.data.key + ", title:" + node.data.title + ", code:" + node.data.code);
// 	 			       $("#activitySelectedId").val(node.data.key);
// 	 			       $("#activitySelectedText").val(node.data.title);
// 	 			      },
// 	 			      onClick: function(node, event) {
// 	 			        // We should not toggle, if target was "checkbox", because this
// 	 			        // would result in double-toggle (i.e. no toggle)
	 			        
// 	 			        if( node.getEventTargetType(event) == "title" )
// 	 			          node.toggleSelect();
	 			        
// 	 			      },
// 	 			      onKeydown: function(node, event) {
// 	 			        if( event.which == 32 ) {
// 	 			          node.toggleSelect();
// 	 			          return false;
// 	 			        }
// 	 			      }	               

// 			 }); 

			$('#using_json_2').jstree({'plugins':["wholerow","checkbox"], 'core' : {
			    'data' : [							       
				{ "id" : "1", "parent" : "#", "text" : "Simple root node" },
			       { "id" : "2", "parent" : "1", "text" : "Root node 2" },
			       { "id" : "3", "parent" : "1", "text" : "Child 1" },
			       { "id" : "4", "parent" : "2", "text" : "MILAIM" },
				   { "id" : "5", "parent" : "2", "text" : "Harvest"},
				   { "id" : "6", "parent" : "5", "text" : "Harvest2"}
					/*{"id" : 7 ,"parent" : 2 ,"text" : "Prerje Pertritese"}*/
			    ]
/*[
{"id": 2 ,"parent": 1 ,"text" : "Harvest"},
{"id" : 7,"parent" : 2,"text" : "Prerje Pertritese"}
]		*/						


			} });
	 

	});            
</script>
</body>
</html>
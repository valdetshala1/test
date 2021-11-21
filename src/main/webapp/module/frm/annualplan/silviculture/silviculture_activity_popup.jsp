<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<html>
<head>
<link rel="stylesheet" href="css/tree/skin/ui.dynatree.css">
<script src="js/libs/jquery.dynatree.min.js"></script>
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
				<label class="col-md-2 control-label"><s:text name="global.filter"/></label>
				<div class="col-md-10">
					<input id="filter_field" name="filter_field"/>
				</div>									
			</div>		
			<div class="form-group">
			<div id="treedomain"> </div>
			</div>	
			
		 <footer class="form-actions">
				<button id="cancelActivity" class="btn btn-default" type="button">
					<s:text name="label.button.cancel"></s:text>
				</button>
				<button id="saveActivity" class="btn btn-primary" type="button">
					<i class="fa fa-save"></i>
					<s:text name="label.button.save"></s:text>
				</button>
		</footer>
		</form>
	</div>
	<!-- end widget content -->
</div>
<!-- end widget div -->


<script type="text/javascript">
	$(document).ready(function () {

		$("#cancelActivity").on('click',function(){
			$("#silvi_activity_popup_content").dialog("close");  			

		});
		
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

		 $("#treedomain").dynatree({
			 	initAjax: { 
				 		  url: 'FrmGrid.domainTreeJSON.do',
				 		  dataType: "json",
						  success: function(node) {
				               // Called after nodes have been created and the waiting icon was removed.
				               // 'this' is the options for this Ajax request
				               console.log("success:" + node.data);
				               },
				           error: function(node, XMLHttpRequest, textStatus, errorThrown) {
				               // Called on error, after error icon was created.
				               },
				           cache: false // Append random '_' argument to url to prevent caching.
				          
			
	               },
	               //postProcess: null, // Callback(data, dataType) before an Ajax result is passed to dynatree.
	              postProcess: function(data, dataType) {
	            	  //var obj = JSON.parse(data);
	            	  //console.log("postProcess:" + obj);
	            	  //traves over json data - over tree
	            	  return data;
	              },     
	 		      onSelect: function(select, node) {
	 			        // Display list of selected nodes
	 			        var selNodes = node.tree.getSelectedNodes();
	 			        // convert to title/key array
	 			        var selKeys = $.map(selNodes, function(node){
	 			             return "[" + node.data.key + "]: '" + node.data.title + "'";
	 			           
	 			             
	 			        });
// 	 			        console.log( node.data.key + ", title:" + node.data.title + ", code:" + node.data.code);
	 			       $("#activitySelectedId").val(node.data.key);
	 			       $("#activitySelectedText").val(node.data.title);
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
	 			      }	               

			 }); 

			$('#filter_field').bind('keypress', function () {
			    var self = $(this);
			    setTimeout(function() {
			    	// Only show nodes matching the specified search term 
			       var str = self.val().toLowerCase();
			       var tree= $("#treedomain").dynatree("getTree");
			       var rootNode = $("#treedomain").dynatree("getRoot");
			       tree.visit(function(node){
			    	   if (node.isVisible() && node.data.title){ 
			    		   // Filter currently visible non-root nodes. 
			               if (node.data.title.toLowerCase().indexOf(self.val().toLowerCase()) >= 0){
			            		// Make sure we and all our parents are visible 
			                   node.visitParents(function(node) 
			                   { 
			                       $(node.li).show(); 
			                       return (node.parent != null); 
			                   }, true); 
			                   
			            		// Terminate the traversal of this branch since the node matches 
			                   return true;
			               }else{ 
			                   // Hide the node. 
			                   $(node.li).hide(); 
			               } 		                
			    	   }
					}, true);	       
			       
			    }, 0);
			});		 

	});            
</script>
</body>
</html>
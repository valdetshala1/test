<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
ui-grid{ width:100% !important; }


.create, .update, .execute {
  border-color: #28a745 !important;
  background-color: #28a745 !important;
}

.create:checked{
  border-color: #28a745 !important;
  background-color: #28a745 !important;
}

.create:focus:not(:checked){
  border-color: #5bd778 !important;
}


/* .squaredThree */
.squaredThree {
  position: relative;
  display:inline-block;
  float: none;
}

.squaredThree label {
  width: 18px;
  height: 18px;
  cursor: pointer;
  position: absolute;
  top: 0;
  left: 0;
  background: green;
  border-radius: 4px; 
}

.squaredThree label:after {
  content: '';
  width: 9px;
  height: 5px;
  position: absolute;
  top: 4px;
  left: 4px;
  border: 3px solid #fcfff4;
  border-top: none;
  border-right: none;
  background: transparent;
  opacity: 0;
  -webkit-transform: rotate(-45deg);
  transform: rotate(-45deg);
}

.squaredThree label:hover::after {
  opacity: 0.3;
}

.squaredThree input[type=checkbox] {
  visibility: hidden;
}

.squaredThree input[type=checkbox]:checked + label:after {
  opacity: 1;
}
/* end .squaredThree */

.label-text {
  position: relative;
  left: 10px;
}

</style>

<script type="text/javascript">
$(document).ready(function () {
	$("#errors").hide();
	getColumnIndexByName = function(grid, columnName) {
      var cm = grid.jqGrid('getGridParam', 'colModel'), i, l;
      for (i = 0, l = cm.length; i < l; i += 1) {
          if (cm[i].name === columnName) {
              return i; // return the index
          }
      }
      return -1;
    };

   function cboxFormatter(cellvalue, options, rowObject) {
       if (rowObject[11] == "true") { //isChild - how else can I check this?
           return '<input style="color: #C0C0C0;" type="checkbox"' + (cellvalue ? ' checked="checked"' : '') + '/>';
       }
       else {
           return '<input type="checkbox"' + (cellvalue ? ' checked="checked"' : '') +
              'onclick="zaznacz(' + options.rowId + ')" />';
       }
   }

   
   var mydata = [{"id":"1","name":"KFIS","code":"kfis","locked":false,"level":"0","parent":"","isLeaf":false,"expanded":true,"loaded":true},
                 {"id":"2","name":"Administration Support","code":"ads","locked":false,"level":1,"parent":"1","isLeaf":false,"expanded":true,"loaded":true},
                 {"id":"13","name":"Assets","code":"asse","locked":false,"level":2,"parent":"2","isLeaf":false,"expanded":true,"loaded":true},
                 {"id":"18","name":"test1","code":"exoff","locked":false,"level":3,"parent":"13","isLeaf":true,"expanded":true,"loaded":true},
                 {"id":"19","name":"test2","code":"exoff","locked":false,"level":3,"parent":"13","isLeaf":true,"expanded":true,"loaded":true},
                 {"id":"17","name":"Excecutive Office","code":"exoff","locked":false,"level":"2","parent":"2","isLeaf":true,"expanded":true,"loaded":true},
                 ];
  var grid = $("#permission_grid");
  grid.jqGrid({
    url: 'AdmGrid.rbacPermissionTree.do',
    
    datatype: 'json',
    mtype: 'GET',
    colNames:['id',
              '<s:text name="rbac.permission.grid.name"/>', 
              '<s:text name="rbac.permission.grid.code"/>', 
              '<s:text name="rbac.permission.grid.locked"/>', 
              '<s:text name="rbac.permission.grid.read"/>',
              '<s:text name="rbac.permission.grid.create"/>', 
              '<s:text name="rbac.permission.grid.update"/>', 
              '<s:text name="rbac.permission.grid.delete"/>', 
              '<s:text name="rbac.permission.grid.execute"/>', 
              '<s:text name="rbac.permission.grid.print"/>'], 
    colModel:[ 
		{name:'id',index:'id', width: 100, sortable:false, hidden:true, key:true},
        {name:'name',index:'name', width: 300, sortable:false}, 
        {name:'code',index:'code', width: 50, align:'left', sortable:false, align:"center"},
        
        {name:'locked',index:'locked', width: 50, align:'center', sortable:false, editable:true, edittype:'checkbox', editoptions: { value:"True:False" }, 
        	formatter: function (cellvalue, options, rowObject) {
        		if(cellvalue == true){
        			return "<input type='checkbox' class='locked' checked='checked' name='op_locked_" + rowObject['id'] + "' title='op_locked_" + rowObject['id'] + "'>";
        		}else{
        			return "<input type='checkbox' class='locked' name='op_locked_" + rowObject['id'] + "' title='op_locked_" + rowObject['id'] + "'>";
            	}
        	}, formatoptions: {disabled : false}},					            
        
        {name:'read',index:'read', width: 50, align:'center', sortable:false, editable:true, edittype:'checkbox', editoptions: { value:"True:False" }, 
        	formatter: function (cellvalue, options, rowObject) {
        		if(cellvalue == true){
        			//return "<div class='squaredThree'><input type='checkbox' class='read' checked='checked' id='op_read_" + rowObject['id'] + "' name='op_read_" + rowObject['id'] + "' title='op_read_" + rowObject['id'] + "'><label for='op_read_" + rowObject['id'] + "'></label></div>";
        			return "<input type='checkbox' class='read' checked='checked' name='op_read_" + rowObject['id'] + "' title='op_read_" + rowObject['id'] + "'>";
        		}else{
        			return "<input type='checkbox' class='read' id='op_read_" + rowObject['id'] + "' name='op_read_" + rowObject['id'] + "' title='op_read_" + rowObject['id'] + "'>";
            	}
        	}, formatoptions: {disabled : false}},
        	
        {name:'create',index:'create', width: 50, align:'center', sortable:false, editable:true, edittype:'checkbox', editoptions: { value:"true:false" }, 
            	formatter: function (cellvalue, options, rowObject) {
                	if(cellvalue == true){
            			return "<input type='checkbox' class='create' checked='checked' name='op_create_" + rowObject['id'] + "' title='op_create_" + rowObject['id'] + "'>";
                	}else{
                		return "<input type='checkbox' class='create' name='op_create_" + rowObject['id'] + "' title='op_create_" + rowObject['id'] + "'>";
                    }
            	}, formatoptions: {disabled : false}},	
            					            	
        {name:'update',index:'update', width: 50, align:'center', sortable:false, editable:true, edittype:'checkbox', editoptions: { value:"True:False" }, 
            	formatter: function (cellvalue, options, rowObject) {
            		if(cellvalue == true){
            			return "<input type='checkbox' class='update' checked='checked' name='op_update" + rowObject['id'] + "' title='op_update_" + rowObject['id'] + "'>";
            		}else{
            			return "<input type='checkbox' class='update' name='op_update" + rowObject['id'] + "' title='op_update_" + rowObject['id'] + "'>";
                	}
            	}, formatoptions: {disabled : false}},

        {name:'delete',index:'delete', width: 50, align:'center', sortable:false, editable:true, edittype:'checkbox', editoptions: { value:"True:False" }, 
        	formatter: function (cellvalue, options, rowObject) {
        		if(cellvalue == true){
        			return "<input type='checkbox' class='delete' checked='checked' name='op_delete" + rowObject['id'] + "' title='op_delete_" + rowObject['id'] + "'>";
        		}else{
        			return "<input type='checkbox' class='delete' name='op_delete" + rowObject['id'] + "' title='op_delete_" + rowObject['id'] + "'>";
            	}
        	}, formatoptions: {disabled : false}},						            	
            	
        {name:'execute',index:'execute', width: 50, align:'center', sortable:false, editable:true, edittype:'checkbox', editoptions: { value:"True:False" }, 
        	formatter: function (cellvalue, options, rowObject) {
        		if(cellvalue == true){
        			return "<input type='checkbox' class='execute' checked='checked' name='op_execute_" + rowObject['id'] + "' title='op_execute_" + rowObject['id'] + "'>";
        		}else{
        			return "<input type='checkbox' class='execute' name='op_execute_" + rowObject['id'] + "' title='op_execute_" + rowObject['id'] + "'>";            		
            	}
        	}, formatoptions: {disabled : false}},
            	
        {name:'print',index:'print', width: 50, align:'center', sortable:false, editable:true, edittype:'checkbox', editoptions: { value:"True:False" }, 
	            formatter: function (cellvalue, options, rowObject) {
	        		if(cellvalue == true){
	            		return "<input type='checkbox' class='print' checked='checked' name='op_read_" + rowObject['id'] + "' title='op_read_" + rowObject['id'] + "'>";
	        		}else{
	        			return "<input type='checkbox' class='print' name='op_print_" + rowObject['id'] + "' title='op_print_" + rowObject['id'] + "'>";		        		
		        	}
	            }, formatoptions: {disabled : false}}
    ],
     jsonReader : { 
    	rows: "rows", 
        page: "page", 
        total: "total", 
        records: "records", 
        repeatitems: false, 
        id: "id"
     },
      gridview: true,
      sortname: 'name',	
      treeGrid: true,
      ignoreCase: true,	
      loadonce: false,
      treeGridModel: 'adjacency',
      treedatatype: 'json',
      datatype: "json",
      ExpandColumn: 'name',
      treeIcons: {leaf:'ui-icon-document-b'},
      height: 'auto',
      pager : "#permission_grid_pager",
      caption: "",
      loadComplete: function (data) {
	    	 grid.jqGrid('setGridParam', { sortname: 'name', sortorder: 'asc' });
	    	 grid.trigger("reloadGrid");

           },
           afterEditCell: function(rowid, cellname, value, iRow, iCol){
                   if(cellname == 'write'){
                       grid.find('tr:eq('+iRow+') td:eq('+iCol+') input:checkbox').attr('checked',!($("#regions").find('tr:eq('+iRow+') td:eq('+iCol+') input:checkbox').attr('checked')));
                       //alert(iRow + "," + iCol);
                   }   
              },
              beforeSelectRow: function (rowid, e) {
             	    var $this = $(this),
             	        isLeafName = $this.jqGrid("getGridParam", "treeReader").leaf_field,
             	        localIdName = $this.jqGrid("getGridParam", "localReader").id,
             	        localData,
             	        state = null,
             	        clsName = null,
             	        setChechedStateOfChildrenItems = function (children) {
             	            $.each(children, function () {
             	                $("#" + this[localIdName] + " input." + clsName).prop("checked", state);
             	                if (!this[isLeafName]) {
             	                    setChechedStateOfChildrenItems($this.jqGrid("getNodeChildren", this));
             	                }
             	            });
             	    	};

                 	console.log("nodeName:" + e.target.nodeName + ", localIdName: " + localIdName);
             	    	
             	    if (e.target.nodeName === "INPUT" || e.target.nodeName === "LABEL") {
             	        state = $(e.target).prop("checked");
             	       state2 = $(e.target).prop("label");
             	        clsName = $(e.target).prop("class");
             	        localData = $this.jqGrid("getLocalRow", rowid);
             	        
             	       	console.log("clsName:" + clsName + ", state:" + state2 + ", rowid:" + rowid);
             	       	
             	        if($this.jqGrid("getNodeChildren", localData).length>0){
             				$.SmartMessageBox({
             					title : "<s:text name='rbac.permission.oper.alert'/>",
             					content : "<s:text name='rbac.permission.all.oper'/>",
             					buttons : '[<s:text name="rbac.permission.button.no"/>][<s:text name="rbac.permission.button.yes"/>]'
             				}, function(ButtonPressed) {
             					if (ButtonPressed === "<s:text name="rbac.permission.button.yes"/>") {
             						setChechedStateOfChildrenItems($this.jqGrid("getNodeChildren", localData), state, clsName);
             					}if (ButtonPressed === "<s:text name="rbac.permission.button.no"/>") {
             					}
             				});	                        	    	    
             	        	
             	        }else{
             	        	$("#" + this[localIdName] + " input." + clsName).prop("checked", state);
              	    }
             	    }
              },	                         
              loadComplete: function () {
                  var iCol = getColumnIndexByName ($(this), 'read'), rows = this.rows, i, c = rows.length;
                  /*
                  for (i = 0; i < c; i += 1) {
                      
                      $(rows[i].cells[iCol]).click(function (e) {
                      });
                  }
                   */
              }
           				              
  });
  grid
   	.navGrid('#permission_grid_pager',{edit:false,add:false,del:false,search:false})
   	.navButtonAdd('#permission_grid_pager',{
   	   caption:"", 
   	   id:"save_perm",
   	   title:'<s:text name="label.button.save"/>', 
   	   buttonicon:"ui-icon-disk", 
   	   onClickButton: function(){
   		$("#save_perm").addClass("ui-state-disabled");
   	   	   var string="[";
   	   	   var count=0;
			  jsonObj = [];
	          jQuery(".jqgrow td input").each(function () {  //detect all input

	        	     var id = $(this).parents('tr').attr('id').replace(/^\s*|\s*$/g, ""); // replace = trim
                     var colname = $(this).parents('td').attr('aria-describedby').replace("permission_grid", ""); // get colname
                     var value = ($(this).prop('checked')) ? "true" : "false";
                     if(value == 'true'){
                         if(count>0){
							string+=",";
                         }
                         string+='{"id":'+id+';"checkbox":"'+value+'";"operation":"'+colname+'"}';
	                     count++;
                     }
                     
               });			
              	 string+="]";
	          var $form = $("#permission_form");
			  $('<input>').attr({
				type : 'hidden',
				name : "jsonPermission",
				value : string
			  }).appendTo($form);

// 			  console.log(string);
			 			          
              $.ajax({
                  url: 'PermissionSave.do',
                  type: 'POST',
                  data : {roleId: $("#roleId").val(), 
                      jsonPermission: string},
                  beforeSend: function (jqXHR, textStatus) {
                  },
      		      success : function(data, status, jqXHR) {
      		    	
					var errors_exits = jqXHR.getResponseHeader("errors_exits");
					if (errors_exits == "true") {
						$("#permission_form_content").html(jqXHR.responseText);
						if(!$("#roleId").val()){
							$("#errors").show();
						}
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.failed"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#C79121",
							timeout: 3000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});
					} else {
						jQuery("#role_grid").trigger("reloadGrid");
						$("#errors").hide();
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 3000,
							icon : "fa fa-check",
							number : "1"
						});
					}	    	
			    },	                      
                  complete: function (jqXHR, textStatus) {$("#save_perm").removeClass("ui-state-disabled");},
                  loadError: function (xhr, status, error) { alert(status + " " + error); }
              });	          
              
   	   }, 
   	   position:"last"
   	});				           	
	var checkboxFix = [];
	$("#permission_grid td[aria-describedby='read'] input").each(function () {
	    		alert($(this).attr('checked'));
	        checkboxFix.push($(this).attr('checked'));
	});


	$("#goBtn").on('click', function() {
		$("#errors").hide();
		if($('#roleId').val()){
			var grid = $("#permission_grid");
			grid.jqGrid({
			    search:true, 
			    postData: { roleId: $('#roleId').val()}
			});	     
			$.extend(grid[0].p.postData,{roleId: $('#roleId').val()});
			grid.trigger("reloadGrid",[{page:1}]);		
		}
		return false;
	});


   $('#roleName').on('keyup', function (event) {
	   $("#errors").hide();
         if(event.which == '13'){
             if($('#roleId').val()){
	     		var grid = $("#permission_grid");
	    		grid.jqGrid({
	    		    search:true, 
	    		    postData: { roleId: $('#roleId').val()}
	    		});	     
	    		$.extend(grid[0].p.postData,{roleId: $('#roleId').val()});
	    		grid.trigger("reloadGrid",[{page:1}]);
             }
         }
   }); 

	
	$("#roleName").autocomplete({
		source: function( request, response ) {
			$.ajax({
				url: "Input.rbacRoles.do?",
				dataType: "json",
				data: {
					featureClass: "P",
					style: "full",
					maxRows: 20,
					minLength: 1,
					name_startsWith: request.term
				},
				success: function( data ) {
					response( $.map( data, function(item) {
						return {
							label: item.name, 
							value: item.name,
							id: item.id 
						};
					}));
				}
			});
		},
		maxRows: 20,
		minLength: 1,
		change: function(event, ui) {
		},
		select: function( event, ui ) {
			$("#roleId").val( ui.item.id);
			var grid = $("#permission_grid");
			grid.jqGrid({
			    search:true, 
			    postData: { roleId: $('#roleId').val()}
			});	     
			$.extend(grid[0].p.postData,{roleId: $('#roleId').val()});
			grid.trigger("reloadGrid",[{page:1}]);
		},
		focus: function(event, ui) {
		}
	});	
	
});

$(window).bind('resize', function() {
	var width = $('#jqGrid_permission_container').width();
    $('#permission_grid').setGridWidth(width);
});

</script>
    
</head>
<body>
	<!-- widget div-->
	<div style="margin-bottom: 1.0em;">
			<form id="permission_form" class="form-horizontal" accept-charset="utf8" method="post">
            <div class="input-group input-group-sm">
                <span class="input-group-addon"><i class="glyphicon glyphicon-filter"></i></span>
                <div class="icon-addon addon-sm">
                    <input type="text" id="roleName" name="roleName" placeholder="<s:text name="rbac.permission.search.role.box"/>" class="form-control">
                    <input id="roleId" name="roleId" type="hidden">
                    <label for="email" class="glyphicon glyphicon-search" rel="tooltip" title="Role"></label>
                </div>
                <span class="input-group-btn">
                    <button class="btn btn-default" id="goBtn" name="goBtn"  type="submit"><s:text name="rbac.permission.button.go"/></button>
                </span>
            </div>
            <div id="errors" class="has-error">
				<span class="help-block"><i class='fa fa-warning'></i> <span id='text'></span><s:text name="role.id.emty"/></span>
			</div>
			</form>
					
		<div id="jqGrid_permission_container">

			<table id="permission_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
			<div id="permission_grid_pager" class="scroll" style="text-align:center;"></div>
		</div>
		
	</div>
	<!-- end widget div -->

 </body>   
			
</html>
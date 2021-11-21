<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<html>
<head>
<style>
    .btn-file {
    position: relative;
    overflow: hidden;
    }
    .btn-file input[type=file] {
    position: absolute;
    top: 0;
    right: 0;
    min-width: 100%;
    min-height: 100%;
    font-size: 100px;
    text-align: right;
    filter: alpha(opacity=0);
    opacity: 0;
    outline: none;
    background: white;
    cursor: inherit;
    display: block;
    }
    
</style>
</head>
<body>    		    
<div id="container">
<br>

<!-- widget grid -->
<section id="widget-grid" class="">
	
	<!-- row -->
	<div class="row">
	
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
			<!-- START widget-person-form -->
			<!-- data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false" -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-persons-grid" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i></span>
					<h2><s:text name="adm.person.legend.person.data.grid"/></h2>
				</header>
				
				<div id="person_grid_content">
					<jsp:include page="person_grid.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-person-form -->
		
		</article>
		<!-- END NEW WIDGET -->
	
	</div>
	<!-- end row -->
		
	<!-- row -->
	<div class="row">
<!-- 			<!-- START NEW WIDGET --> 
<!-- 		<article class="col-sm-12 col-md-12 col-lg-6"> -->
<!-- 			<!-- START widget-person-list --> 
<!-- 			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-person-list"> -->
<!-- 				<header> -->
<%-- 					<span class="widget-icon"> <i class="fa fa-table"></i> </span> --%>
<!-- 					<h2>Person List</h2> -->
<!-- 				</header> -->
				
<!-- 				<div id="person_list_content"> -->
<%-- 					<jsp:include page="person_list.jsp"></jsp:include> --%>
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<!-- END widget-person-list --> 
<!-- 		</article>	 -->
<!-- 		<!-- END NEW WIDGET --> 
		
		<!-- START NEW WIDGET -->
		<article class="col-sm-12">
		
			<!-- START widget-person-form -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-persons-form" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i></span>
					<h2><s:text name="adm.person.legend.person.data"/></h2>
				</header>
				
				<div id="person_form_content">
					<jsp:include page="person_form.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-person-form -->
		
		 </article>
		 <!-- END NEW WIDGET -->		
			
	</div>
	<!-- end row -->	
		
	
</section>
<!-- end widget grid -->
	    
<script type="text/javascript">
	// DO NOT REMOVE : GLOBAL FUNCTIONS!
	pageSetUp();

	/* remove previous elems */
	
	if($('.DTTT_dropdown.dropdown-menu').length){
		$('.DTTT_dropdown.dropdown-menu').remove();
	}

	loadDataTableScripts();
	function loadDataTableScripts() {

		loadScript("js/plugin/datatables/jquery.dataTables-cust.min.js", dt_2);

		function dt_2() {
			loadScript("js/plugin/datatables/ColReorder.min.js", dt_3);
		}

		function dt_3() {
			loadScript("js/plugin/datatables/FixedColumns.min.js", dt_4);
		}

		function dt_4() {
			loadScript("js/plugin/datatables/ColVis.min.js", dt_5);
		}

		function dt_5() {
			loadScript("js/plugin/datatables/ZeroClipboard.js", dt_6);
		}

		function dt_6() {
			loadScript("js/plugin/datatables/media/js/TableTools.min.js", dt_7);
		}

		function dt_7() {
			loadScript("js/plugin/datatables/DT_bootstrap.js", runDataTables);
		}

	}

	function runDataTables() {

		/*
		 * BASIC
		 */
		$('#dt_basic').dataTable({
			"sPaginationType" : "bootstrap_full"
		});

		/* END BASIC */

		/* Add the events etc before DataTables hides a column */
		$("#datatable_fixed_column thead input").keyup(function() {
			oTable.fnFilter(this.value, oTable.oApi._fnVisibleToColumnIndex(oTable.fnSettings(), $("thead input").index(this)));
		});

		$("#datatable_fixed_column thead input").each(function(i) {
			this.initVal = this.value;
		});
		$("#datatable_fixed_column thead input").focus(function() {
			if (this.className == "search_init") {
				this.className = "";
				this.value = "";
			}
		});
		$("#datatable_fixed_column thead input").blur(function(i) {
			if (this.value == "") {
				this.className = "search_init";
				this.value = this.initVal;
			}
		});		
		

		var oTable = $('#datatable_fixed_column').dataTable({
			"sDom" : "<'dt-top-row'><'dt-wrapper't><'dt-row dt-bottom-row'<'row'<'col-sm-6'i><'col-sm-6 text-right'p>>",
			//"sDom" : "t<'row dt-wrapper'<'col-sm-6'i><'dt-row dt-bottom-row'<'row'<'col-sm-6'i><'col-sm-6 text-right'>>",
			"oLanguage" : {
				"sSearch" : "Search all columns:"
			},
			"bSortCellsTop" : true
		});		
		


		/*
		 * COL ORDER
		 */
		$('#datatable_col_reorder').dataTable({
			"sPaginationType" : "bootstrap",
			"sDom" : "R<'dt-top-row'Clf>r<'dt-wrapper't><'dt-row dt-bottom-row'<'row'<'col-sm-6'i><'col-sm-6 text-right'p>>",
			"fnInitComplete" : function(oSettings, json) {
				$('.ColVis_Button').addClass('btn btn-default btn-sm').html('Columns <i class="icon-arrow-down"></i>');
			}
		});
		
		/* END COL ORDER */

		/* TABLE TOOLS */
		$('#datatable_tabletools').dataTable({
			"sDom" : "<'dt-top-row'Tlf>r<'dt-wrapper't><'dt-row dt-bottom-row'<'row'<'col-sm-6'i><'col-sm-6 text-right'p>>",
			"oTableTools" : {
				"aButtons" : ["copy", "print", {
					"sExtends" : "collection",
					"sButtonText" : 'Save <span class="caret" />',
					"aButtons" : ["csv", "xls", "pdf"]
				}],
				"sSwfPath" : "js/plugin/datatables/media/swf/copy_csv_xls_pdf.swf"
			},
			"fnInitComplete" : function(oSettings, json) {
				$(this).closest('#dt_table_tools_wrapper').find('.DTTT.btn-group').addClass('table_tools_group').children('a.btn').each(function() {
					$(this).addClass('btn-sm btn-default');
				});
			}
		});
		
		/* END TABLE TOOLS */

	}	
</script>

</div>
</body>
</html>

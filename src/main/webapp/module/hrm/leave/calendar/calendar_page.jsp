<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<html>
<head>
</head>
<body>    		    
<s:set var="llsize" name="llsize" value="%{leaveList.size}" />
<div id="container">
<div class="row">
	<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
		<h1 class="page-title txt-color-blueDark"><i class="fa fa-calendar fa-fw "></i> 
			<s:text name="leave.calendar.label.calendar"/>
		</h1>
	</div>
</div>
<!-- row -->

<div class="row">

	<div class="col-sm-12 col-md-12 col-lg-3">
		<!-- new widget -->
		<div class="jarviswidget jarviswidget-color-blueDark">
			<header>
				<h2><s:text name="leave.calendar.label.add.events"/></h2>
			</header>

			<!-- widget div-->
			<div>

				<div class="widget-body">
					<!-- content goes here -->

					<form id="add-event-form">
						<fieldset>

							<div class="form-group">
								<label><s:text name="leave.calendar.label.select.event.icon"/></label>
								<div class="btn-group btn-group-sm btn-group-justified" data-toggle="buttons">
									<label class="btn btn-default active">
										<input type="radio" name="iconselect" id="icon-1" value="fa-info" checked>
										<i class="fa fa-info text-muted"></i> </label>
									<label class="btn btn-default">
										<input type="radio" name="iconselect" id="icon-2" value="fa-warning">
										<i class="fa fa-warning text-muted"></i> </label>
									<label class="btn btn-default">
										<input type="radio" name="iconselect" id="icon-3" value="fa-check">
										<i class="fa fa-check text-muted"></i> </label>
									<label class="btn btn-default">
										<input type="radio" name="iconselect" id="icon-4" value="fa-user">
										<i class="fa fa-user text-muted"></i> </label>
									<label class="btn btn-default">
										<input type="radio" name="iconselect" id="icon-5" value="fa-lock">
										<i class="fa fa-lock text-muted"></i> </label>
									<label class="btn btn-default">
										<input type="radio" name="iconselect" id="icon-6" value="fa-clock-o">
										<i class="fa fa-clock-o text-muted"></i> </label>
								</div>
							</div>

							<div class="form-group">
								<label><s:text name="leave.calendar.label.event.title"/></label>
								<input class="form-control"  id="event.title" name="event.title" maxlength="40" type="text" placeholder="Event Title">
							</div>
							<div class="form-group">
								<label><s:text name="leave.calendar.label.start.time"/></label>
								<input class="form-control"  id="event.startTime" name="event.startTime" maxlength="40" type="text" placeholder="Event Title">
							</div>	
							<div class="form-group">
								<label><s:text name="leave.calendar.label.end.time"/></label>
								<input class="form-control"  id="event.endTime" name="event.endTime" maxlength="40" type="text" placeholder="Event Title">
							</div>	
							<div class="form-group">
								<label><s:text name="leave.calendar.label.event.location"/></label>
								<input class="form-control"  id="event.location" name="event.location" maxlength="40" type="text" placeholder="<s:text name="leave.calendar.label.event.location"/>">
							</div>																					
							<div class="form-group">
								<label><s:text name="leave.calendar.event.description"/></label>
								<textarea class="form-control" placeholder="Please be brief" rows="3" maxlength="40" id="event.description" name="event.description"></textarea>
								<p class="note"><s:text name="leave.calendar.max.length.40"/></p>
							</div>

							<div class="form-group">
								<label><s:text name="leave.calendar.label.select.event.color"/></label>
								<div class="btn-group btn-group-justified btn-select-tick" data-toggle="buttons">
									<label class="btn bg-color-darken active">
										<input type="radio" name="event.priority" id="option1" value="bg-color-darken txt-color-white" checked>
										<i class="fa fa-check txt-color-white"></i> </label>
									<label class="btn bg-color-blue">
										<input type="radio" name="event.priority" id="option2" value="bg-color-blue txt-color-white">
										<i class="fa fa-check txt-color-white"></i> </label>
									<label class="btn bg-color-orange">
										<input type="radio" name="event.priority" id="option3" value="bg-color-orange txt-color-white">
										<i class="fa fa-check txt-color-white"></i> </label>
									<label class="btn bg-color-greenLight">
										<input type="radio" name="event.priority" id="option4" value="bg-color-greenLight txt-color-white">
										<i class="fa fa-check txt-color-white"></i> </label>
									<label class="btn bg-color-blueLight">
										<input type="radio" name="event.priority" id="option5" value="bg-color-blueLight txt-color-white">
										<i class="fa fa-check txt-color-white"></i> </label>
									<label class="btn bg-color-red">
										<input type="radio" name="event.priority" id="option6" value="bg-color-red txt-color-white">
										<i class="fa fa-check txt-color-white"></i> </label>
								</div>
							</div>

						</fieldset>
						<div class="form-actions">
							<div class="row">
								<div class="col-md-12">
									<button class="btn btn-default" type="button" id="addevent">
										<s:text name="leave.calendar.label.add.event"/>
									</button>
								</div>
							</div>
						</div>
					</form>

					<!-- end content -->
				</div>

			</div>
			<!-- end widget div -->
		</div>
		<!-- end widget -->

		<div class="well well-sm" id="event-container">
			<form>
				<legend>
					<s:text name="leave.calendar.label.draggable.events"/>
				</legend>
				<ul id='external-events' class="list-unstyled">
					<li>
						<span class="bg-color-darken txt-color-white" data-description="Currently busy" data-icon="fa-time"><s:text name="leave.calendar.label.office.meeting"/></span>
					</li>
					<li>
						<span class="bg-color-blue txt-color-white" data-description="No Description" data-icon="fa-pie"><s:text name="leave.calendar.label.lunch.break"/></span>
					</li>
					<li>
						<span class="bg-color-red txt-color-white" data-description="Urgent Tasks" data-icon="fa-alert"><s:text name="leave.calendar.label.urgent"/></span>
					</li>
				</ul>
				<div class="checkbox">
					<label>
						<input type="checkbox" id="drop-remove" class="checkbox style-0" checked="checked">
						<span><s:text name="leave.calendar.label.remove.after.drop"/></span> </label>

				</div>
			</form>

		</div>
	</div>
	<div class="col-sm-12 col-md-12 col-lg-9">

		<!-- new widget -->
		<div class="jarviswidget jarviswidget-color-blueDark">

			<!-- widget options:
			usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false">

			data-widget-colorbutton="false"
			data-widget-editbutton="false"
			data-widget-togglebutton="false"
			data-widget-deletebutton="false"
			data-widget-fullscreenbutton="false"
			data-widget-custombutton="false"
			data-widget-collapsed="true"
			data-widget-sortable="false"

			-->
			<header>
				<span class="widget-icon"> <i class="fa fa-calendar"></i> </span>
				<h2> <s:text name="leave.calendar.label.my.events"/> </h2>
				<div class="widget-toolbar">
					<!-- add: non-hidden - to disable auto hide -->
					<div class="btn-group">
						<button class="btn dropdown-toggle btn-xs btn-default" data-toggle="dropdown">
							<s:text name="leave.calendar.label.showing"/> <i class="fa fa-caret-down"></i>
						</button>
						<ul class="dropdown-menu js-status-update pull-right">
							<li>
								<a href="javascript:void(0);" id="mt"><s:text name="leave.calendar.label.month"/></a>
							</li>
							<li>
								<a href="javascript:void(0);" id="ag"><s:text name="leave.calendar.label.agenda"/></a>
							</li>
							<li>
								<a href="javascript:void(0);" id="td"><s:text name="leave.calendar.label.today"/></a>
							</li>
						</ul>
					</div>
				</div>
			</header>

			<!-- widget div-->
			<div>

				<div class="widget-body no-padding">
					<!-- content goes here -->
					<div class="widget-body-toolbar">

						<div id="calendar-buttons">

							<div class="btn-group">
								<a href="javascript:void(0)" class="btn btn-default btn-xs" id="btn-prev"><i class="fa fa-chevron-left"></i></a>
								<a href="javascript:void(0)" class="btn btn-default btn-xs" id="btn-next"><i class="fa fa-chevron-right"></i></a>
							</div>
						</div>
					</div>
					<div id="calendar"></div>

					<!-- end content -->
				</div>

			</div>
			<!-- end widget div -->
		</div>
		<!-- end widget -->

	</div>
	
</div>


<!-- end row -->

<script type="text/javascript">
	// DO NOT REMOVE : GLOBAL FUNCTIONS!
	pageSetUp();
	
	// PAGE RELATED SCRIPTS
	
	/*
	 * FULL CALENDAR JS
	 */
	loadScript("js/plugin/fullcalendar/jquery.fullcalendar.min.js", iniCalendar);
	
	function iniCalendar() {
	    "use strict";
	
	    var date = new Date();
	    var d = date.getDate();
	    var m = date.getMonth();
	    var y = date.getFullYear();
	
	    var hdr = {
	        left: 'title',
	        center: 'month,agendaWeek,agendaDay',
	        right: 'prev,today,next'
	    };
	
	    var initDrag = function (e) {
	        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
	        // it doesn't need to have a start or end
	
	        var eventObject = {
	            title: $.trim(e.children().text()), // use the element's text as the event title
	            description: $.trim(e.children('span').attr('data-description')),
	            icon: $.trim(e.children('span').attr('data-icon')),
	            className: $.trim(e.children('span').attr('class')) // use the element's children as the event class
	        };
	        // store the Event Object in the DOM element so we can get to it later
	        e.data('eventObject', eventObject);
	
	        // make the event draggable using jQuery UI
	        e.draggable({
	            zIndex: 999,
	            revert: true, // will cause the event to go back to its
	            revertDuration: 0 //  original position after the drag
	        });	    };
	
	    var addEvent = function (title, priority, description, icon) {
	        title = title.length === 0 ? "<s:text name="leave.calendar.label.untitled.event"/>" : title;
	        description = description.length === 0 ? "<s:text name="leave.calendar.label.no.description"/>" : description;
	        icon = icon.length === 0 ? " " : icon;
	        priority = priority.length === 0 ? "label label-default" : priority;
	
	        var html = $('<li><span class="' + priority + '" data-description="' + description + '" data-icon="' +
	            icon + '">' + title + '</span></li>').prependTo('ul#external-events').hide().fadeIn();
	
	        $("#event-container").effect("highlight", 800);
	
	        initDrag(html);
	    };
	
	    /* initialize the external events
		 -----------------------------------------------------------------*/
	
	    $('#external-events > li').each(function () {
	        initDrag($(this));
	    });
	
	    $('#add-event').click(function () {
	        var title = $('#title').val(),
	            priority = $('input:radio[name=priority]:checked').val(),
	            description = $('#description').val(),
	            icon = $('input:radio[name=iconselect]:checked').val();
	
	        addEvent(title, priority, description, icon);
	    });
	
	    /* initialize the calendar
		 -----------------------------------------------------------------*/
	
	    $('#calendar').fullCalendar({
	
	        header: hdr,
	        buttonText: {
	            prev: '<i class="fa fa-chevron-left"></i>',
	            next: '<i class="fa fa-chevron-right"></i>'
	        },
	
	        editable: true,
	        droppable: false, // this allows things to be dropped onto the calendar !!!
	
	        drop: function (date, allDay) { // this function is called when something is dropped
	
	            // retrieve the dropped element's stored Event Object
	            var originalEventObject = $(this).data('eventObject');
	
	            // we need to copy it, so that multiple events don't have a reference to the same object
	            var copiedEventObject = $.extend({}, originalEventObject);
	
	            // assign it the date that was reported
	            copiedEventObject.start = date;
	            copiedEventObject.allDay = allDay;
	
	            // render the event on the calendar
	            // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
	            $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
	
	            // is the "remove after drop" checkbox checked?
	            if ($('#drop-remove').is(':checked')) {
	                // if so, remove the element from the "Draggable Events" list
	                $(this).remove();
	            }
	
	        },
	        select: function (start, end, allDay) {
	            var title = prompt('Event Title:');
	            if (title) {
	                calendar.fullCalendar('renderEvent', {
	                        title: title,
	                        start: start,
	                        end: end,
	                        allDay: allDay
	                    }, true // make the event "stick"
	                );
	            }
	            calendar.fullCalendar('unselect');
	        },
	        events:function( start, end, callback ) {
	            var year  = end.getFullYear();
	            var month = end.getMonth();
			    $.ajax({
                    url: "Leave.calendarDate.do?current_year="+year+"&current_month="+month,
                    dataType: 'json',
                    type: 'POST',
                    success: function( response ) {
                        callback(response);
                    }
                });
	        },
	        eventRender: function (event, element, icon) {
	            if (!event.description == "") {
	                element.find('.fc-event-title').append("<br/><span class='ultra-light'>" + event.description +
	                    "</span>");
	            }
	            if (!event.icon == "") {
	                element.find('.fc-event-title').append("<i class='air air-top-right fa " + event.icon +
	                    " '></i>");
	            }
	        },
	        windowResize: function (event, ui) {
	            $('#calendar').fullCalendar('render');
	        }
	    });
	
	    /* hide default buttons */
	    $('.fc-header-right, .fc-header-center').hide();
	}
	
	
	$('#calendar-buttons #btn-prev').click(function () {
	    $('.fc-button-prev').click();
	    return true;
	});
	
	$('#calendar-buttons #btn-next').click(function (calEvent) {
	    $('.fc-button-next').click();
	    return true;
	});	
	
	$('#calendar-buttons #btn-today').click(function () {
	    $('.fc-button-today').click();
	    return false;
	});
	
	$('#mt').click(function () {
	    $('#calendar').fullCalendar('changeView', 'month');
	});
	
	$('#ag').click(function () {
	    $('#calendar').fullCalendar('changeView', 'agendaWeek');
	});
	
	$('#td').click(function () {
	    $('#calendar').fullCalendar('changeView', 'agendaDay');
	});

	$('#addevent').click(function () {
		alert("addevent");
	});
	
	$('#event\\.startTime').datetimepicker({
		lang: 'al',
		format: 'd.m.Y H:i',
		mask: true,
		onShow:function( ct ){
			this.setOptions({
		      minTime:'07:00',
		      maxTime:'20:00'
	    	});
		}
	});
	
	$('#event\\.endTime').datetimepicker({
		lang: 'al',
		format: 'd.m.Y H:i',
		mask: true,
		onShow:function( ct ){
			this.setOptions({
		      minTime:'07:00',
		      maxTime:'20:00'
		    });
		}
	});
</script>


</div>
</body>
</html>

$.widget("ui.combobox_ajax", {
    _create: function() {
        var _self = this
            , options = $.extend({}, this.options, {
            minLength: 0,
            source: function(request, response) {
                if (typeof _self.options.source === "function") {
                    _self.options.source(request, response);
                } else if (typeof _self.options.source === "string") {
                    $.ajax({
                        url: _self.options.source,
                        data: request,
                        dataType: "json",
                        success: function(data, status) {
                            response(data);
                        },
                        error: function() {
                            response([]);
                        }
                    });
                }

            }
        });
        
        this.element.autocomplete(options);
        this.element.addClass( "ui-widget ui-widget-content ui-corner-left" );
       /* 	
        this.button = $("<button type='button'>&nbsp;</button>")
            .attr("tabIndex", -1)
            .attr("title", "Show All Items")
            .insertAfter(this.element)
            .button({
                icons: {
                    primary: "ui-icon-triangle-1-s"
                },
            text: false
            })
            .removeClass("ui-corner-all")
            .addClass("ui-corner-right ui-button-icon")
            .click(function() {
                if (_self.element.autocomplete("widget").is(":visible")) {
                    _self.element.autocomplete("close");
                    return;
                }
                _self.element.autocomplete("search", " ");
                _self.element.focus();
        });
        */
    }
});

$.widget("ui.combobox_ajax_term", {
    _create: function() {
        var _self = this
            , options = $.extend({}, this.options, {
            minLength: this.options.minLength,
            source: function(request, response) {
                if (typeof _self.options.source === "function") {
                    _self.options.source(request, response);
                } else if (typeof _self.options.source === "string") {
                    $.ajax({
                        url: _self.options.source,
                        data: request,
                        dataType: "json",
                        success: function(data, status) {
                            response(data);
                        },
                        error: function() {
                            response([]);
                        }
                    });
                }

            }
        });
        
        this.element.autocomplete(options);

        this.button = $("<button type='button'>&nbsp;</button>")
            .attr("tabIndex", -1)
            .attr("title", "Show All Items")
            .insertAfter(this.element)
            .button({
                icons: {
                    primary: "ui-icon-triangle-1-s"
                },
            text: false
            })
            .removeClass("ui-corner-all")
            .addClass("ui-corner-right ui-button-icon")
            .click(function() {
            	
                if (_self.element.autocomplete("widget").is(":visible")) {
                    _self.element.autocomplete("close");
                    return;
                }
                _self.element.autocomplete("search", " ");
                _self.element.focus();
        });
    }
});

$.widget("ui.combobox_ajax_term_desc", {
    _create: function() {
        var _self = this
            , options = $.extend({}, this.options, {
            minLength: this.options.minLength,
            source: function(request, response) {
                if (typeof _self.options.source === "function") {
                    _self.options.source(request, response);
                } else if (typeof _self.options.source === "string") {
                    $.ajax({
                        url: _self.options.source,
                        data: request,
                        dataType: "json",
                        success: function(data, status) {
                            response(data);
                        },
                        error: function() {
                            response([]);
                        }
                    });
                }

            }
        });

        /*.data( "ui-autocomplete" )._renderItem = function( ul, item ) {      
        	return $( "<li>" )        
        		.append( "<a>" + item.label + "<br>" + item.desc + "</a>" )        
        		.appendTo( ul );    
        };*/
        
        this.element.autocomplete(options);

        this.button = $("<button type='button'>&nbsp;</button>")
            .attr("tabIndex", -1)
            .attr("title", "Show All Items")
            .insertAfter(this.element)
            .button({
                icons: {
                    primary: "ui-icon-triangle-1-s"
                },
            text: false
            })
            .removeClass("ui-corner-all")
            .addClass("ui-corner-right ui-button-icon")
            .click(function() {
                if (_self.element.autocomplete("widget").is(":visible")) {
                    _self.element.autocomplete("close");
                    return;
                }
                _self.element.autocomplete("search", "");
                _self.element.focus();
        });
    }
});

$.widget( "ui.combobox_desc", {
	_create: function() {
		var input,
			that = this,
			select = this.element.hide(),
			selected = select.children( ":selected" ),
			value = selected.val() ? selected.text() : "",
			wrapper = this.wrapper = $( "<span>" )
				.addClass( "ui-combobox" )
				.insertAfter( select );

		function removeIfInvalid(element) {
			var value = $( element ).val(),
				matcher = new RegExp( "^" + $.ui.autocomplete.escapeRegex( value ) + "$", "i" ),
				valid = false;
			select.children( "option" ).each(function() {
				if ( $( this ).text().match( matcher ) ) {
					this.selected = valid = true;
					return false;
				}
			});
			if ( !valid ) {
				// remove invalid value, as it didn't match anything
				$( element )
					.val( "" )
					.attr( "title", value + " didn't match any item" )
					.tooltip( "open" );
				select.val( "" );
				setTimeout(function() {
					input.tooltip( "close" ).attr( "title", "" );
				}, 2500 );
				input.data( "autocomplete" ).term = "";
				return false;
			}
		}

		input = $( "<input>" )
			.appendTo( wrapper )
			.val( value )
			.attr( "title", "test" )
			.addClass( "ui-state-default ui-combobox-input" )
			.autocomplete({
				delay: 0,
				minLength: 0,
				source: function( request, response ) {
					var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
					response( select.children( "option" ).map(function() {
						var text = $( this ).text();
						if ( this.value && ( !request.term || matcher.test(text) ) )
							return {
								label: text.replace(
									new RegExp(
										"(?![^&;]+;)(?!<[^<>]*)(" +
										$.ui.autocomplete.escapeRegex(request.term) +
										")(?![^<>]*>)(?![^&;]+;)", "gi"
									), "<strong>$1</strong>" ),
								value: text,
								id: this.value,
								desc: $(this).attr("desc"),
								budget: $(this).attr("budget"),
								restbudget: $(this).attr("restbudget"),
								option: this
							};
					}) );
				},
				select: function( event, ui ) {
					ui.item.option.selected = true;
					that._trigger( "selected", event, {
						item: ui.item.option
					});
					if($("#budget").length > 0){
						if(ui.item.restbudget != ""){
							$("#budget").val(ui.item.restbudget);
						}else{
							$("#budget").val(ui.item.budget);
						}
						
					}
				},
				change: function( event, ui ) {
					if ( !ui.item )
						return removeIfInvalid( this );
				}
			})
			.addClass( "ui-widget ui-widget-content ui-corner-left" );
		/*
		input.data( "autocomplete" )._renderItem = function( ul, item ) {
			return $( "<li>" )
				.data( "item.autocomplete", item )
				.append( "<a>" + item.label + "<br><span style='font-size:small;'>" + item.desc + "</span></a>" )
				.appendTo( ul );
		};
		*/

		$( "<a>" )
			.attr( "tabIndex", -1 )
			.attr( "title", "Show All Items" )
			.appendTo( wrapper )
			.button({
				icons: {
					primary: "ui-icon-triangle-1-s"
				},
				text: false
			})
			.removeClass( "ui-corner-all" )
			.addClass( "ui-corner-right ui-combobox-toggle" )
			.click(function() {
				// close if already visible
				if ( input.autocomplete( "widget" ).is( ":visible" ) ) {
					input.autocomplete( "close" );
					removeIfInvalid( input );
					return;
				}

				// work around a bug (likely same cause as #5265)
				$( this ).blur();

				// pass empty string as value to search for, displaying all results
				input.autocomplete( "search", "" );
				input.focus();
			});

	},

	destroy: function() {
		this.wrapper.remove();
		this.element.show();
		$.Widget.prototype.destroy.call( this );
	}
});

$.widget("ui.combobox_group_desc", {
    _create: function() {
        var input, self = this,
            select = this.element.hide(),
            selected = select.children(":selected"),
            value = selected.val() ? selected.text() : "",
            wrapper = this.wrapper = $("<span>").addClass("ui-combobox").insertAfter(select);

        input = $("<input>").appendTo(wrapper).val(value).addClass("ui-state-default ui-combobox-input").autocomplete({
            delay: 0,
            minLength: 0,
            source: function(request, response) {
                var matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i");

                response(select.find("option").map(function() {
                    var text = $(this).text();
                    if (this.value && (!request.term || matcher.test(text))) return {
                        label: text.replace(
                        new RegExp("(?![^&;]+;)(?!<[^<>]*)(" + $.ui.autocomplete.escapeRegex(request.term) + ")(?![^<>]*>)(?![^&;]+;)", "gi"), "<strong>$1</strong>"),
                        value: text,
                        desc: $(this).attr("desc"),
                        option: this,
                        category: $(this).closest("optgroup").attr("label")
                    };
                    //MK 
                    $('#test').attr('style', 'display: none;');
                }).get());
            },
            select: function(event, ui) {
                ui.item.option.selected = true;
                self._trigger("selected", event, {
                    item: ui.item.option
                });
            },
            change: function(event, ui) {
                if (!ui.item) {
                    var matcher = new RegExp("^" + $.ui.autocomplete.escapeRegex($(this).val()) + "$", "i"),
                        valid = false;
                    select.children("option").each(function() {
                        if ($(this).text().match(matcher)) {
                            this.selected = valid = true;
                            return false;
                        }
                    });
                    if (!valid) {
                        $('#test').attr('style', 'display: block;');
                        // remove invalid value, as it didn't match anything
                        //$( this ).val( "" );
                        //select.val( "" );
                        //input.data( "autocomplete" ).term = "";
                        //return false;                    
                    }
                }
            }
        }).addClass("ui-widget ui-widget-content ui-corner-left");

        
        input.data("autocomplete")._renderItem = function(ul, item) {
            return $("<li></li>").data("item.autocomplete", item).append("<a>" + item.label + "<br><span style='font-size:x-small;'>" + item.desc + "</span></a>").appendTo(ul);
        };


        input.data("autocomplete")._renderMenu = function(ul, items) {
            var self = this,
            categories = { },                
            currentCategory = "";

            /* Build a dictionary/hash where keys are categories and values are 
             * arrays of items with that category 
             */
            $.each(items, function (index, item) {
                if (!categories.hasOwnProperty(item.category)) {
                     categories[item.category] = [item];
                } else {
                    categories[item.category] = categories[item.category].concat([item]);
                }
            });

            /* Iterate over the hash we just built and display a category followed by its
             * items.
             */
            $.each(categories, function(category, items) {
                if (category) {
                    ul.append("<li class='ui-autocomplete-category'>" + category + " (" + items.length + ")</li>");
                }
                $.each(items, function (index, item) {
                    self._renderItem(ul, item);
                });
            });                
        };

        // This line added to set default value of the combobox
		input.val(jQuery("#"+select.attr("id")+" :selected").text() );  
        //input.val( $(select).find("option:selected").text());
        
        $("<a>").attr("tabIndex", -1).attr("title", "Show All Items").appendTo(wrapper).button({
            icons: {
                primary: "ui-icon-triangle-1-s"
            },
            text: false
        }).removeClass("ui-corner-all").addClass("ui-corner-right ui-combobox-toggle").click(function() {
            // close if already visible
            if (input.autocomplete("widget").is(":visible")) {
                input.autocomplete("close");
                return;
            }

            // work around a bug (likely same cause as #5265)
            $(this).blur();

            // pass empty string as value to search for, displaying all results
            input.autocomplete("search", "");
            input.focus();
        });
    },
    open: function() {
        /*$('.ui-autocomplete-category').next('.ui-menu-item').addClass('ui-first');*/
    },  
    destroy: function() {
        this.wrapper.remove();
        this.element.show();
        $.Widget.prototype.destroy.call(this);
    }
});

$.widget( "ui.combobox_static", {
		_create: function() {
			var input,
				that = this,
				select = this.element.hide(),
				selected = select.children( ":selected" ),
				value = selected.val() ? selected.text() : "",
				wrapper = this.wrapper = $( "<span>" )
					.addClass( "ui-combobox" )
					.insertAfter( select );

			function removeIfInvalid(element) {
				var value = $( element ).val(),
					matcher = new RegExp( "^" + $.ui.autocomplete.escapeRegex( value ) + "$", "i" ),
					valid = false;
				select.children( "option" ).each(function() {
					if ( $( this ).text().match( matcher ) ) {
						this.selected = valid = true;
						return false;
					}
				});
				if ( !valid ) {
					// remove invalid value, as it didn't match anything
					$( element )
						.val( "" )
						.attr( "title", value + " didn't match any item" )
						.tooltip( "open" );
					select.val( "" );
					setTimeout(function() {
						input.tooltip( "close" ).attr( "title", "" );
					}, 2500 );
					input.data( "autocomplete" ).term = "";
					return false;
				}
			}

			input = $( "<input>" )
				.appendTo( wrapper )
				.val( value )
				.attr( "title", "SELECT ITEM .." )
				.addClass( "ui-state-default ui-combobox-input" )
				.autocomplete({
					delay: 0,
					minLength: 0,
					source: function( request, response ) {
						var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
						response( select.children( "option" ).map(function() {
							var text = $( this ).text();
							if ( this.value && ( !request.term || matcher.test(text) ) )
								return {
									label: text.replace(
										new RegExp(
											"(?![^&;]+;)(?!<[^<>]*)(" +
											$.ui.autocomplete.escapeRegex(request.term) +
											")(?![^<>]*>)(?![^&;]+;)", "gi"
										), "<strong>$1</strong>" ),
									value: text,
									id: this.value,
									desc: $(this).attr("desc"),
									option: this
								};
						}) );
					},
					select: function( event, ui ) {
						ui.item.option.selected = true;
						that._trigger( "selected", event, {
							item: ui.item.option
						});
					},
					change: function( event, ui ) {
						if ( !ui.item )
							return removeIfInvalid( this );
					}
				})
				.addClass( "ui-widget ui-widget-content ui-corner-left" );

			input.data( "autocomplete" )._renderItem = function( ul, item ) {
				return $( "<li>" )
					.data( "item.autocomplete", item )
					.append( "<a>" + item.label + "</a>" )
					.appendTo( ul );
			};

			$( "<a>" )
				.attr( "tabIndex", -1 )
				.attr( "title", "Show All Items" )
				.appendTo( wrapper )
				.button({
					icons: {
						primary: "ui-icon-triangle-1-s"
					},
					text: false
				})
				.removeClass( "ui-corner-all" )
				.addClass( "ui-corner-right ui-combobox-toggle" )
				.click(function() {
					// close if already visible
					if ( input.autocomplete( "widget" ).is( ":visible" ) ) {
						input.autocomplete( "close" );
						removeIfInvalid( input );
						return;
					}

					// work around a bug (likely same cause as #5265)
					$( this ).blur();

					// pass empty string as value to search for, displaying all results
					input.autocomplete( "search", "");
					input.focus();
				});

		},

		destroy: function() {
			this.wrapper.remove();
			this.element.show();
			$.Widget.prototype.destroy.call( this );
		}
});    


$.widget("ui.combobox", {
    _create: function() {
        var _self = this
            , options = $.extend({}, this.options, {
            minLength: 0,
            source: function(request, response) {
                if (!request.term.length) {
                    response(_self.options.initialValues);
                } else {
                    if (typeof _self.options.source === "function") {
                        _self.options.source(request, response);
                    } else if (typeof _self.options.source === "string") {
                        $.ajax({
                            url: _self.options.source,
                            data: request,
                            dataType: "json",
                            success: function(data, status) {
                                response(data);
                            },
                            error: function() {
                                response([]);
                            }
                        });
                    }
                }
            }
        });
        
        this.element.autocomplete(options);

        this.button = $("<button type='button'>&nbsp;</button>")
            .attr("tabIndex", -1)
            .attr("title", "Show All Items")
            .insertAfter(this.element)
            .button({
                icons: {
                    primary: "ui-icon-triangle-1-s"
                },
            text: false
            })
            .removeClass("ui-corner-all")
            .addClass("ui-corner-right ui-button-icon")
            .click(function() {
                if (_self.element.autocomplete("widget").is(":visible")) {
                    _self.element.autocomplete("close");
                    return;
                }
                _self.element.autocomplete("search", "");
                _self.element.focus();
        });
    }
});
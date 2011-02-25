var AjaxLiveSearch = {

    instance: function(options) {

        var KEY = {
            UP: 38,
            DOWN: 40,
            DEL: 46,
            TAB: 9,
            RETURN: 13,
            ESC: 27,
            COMMA: 188,
            PAGEUP: 33,
            PAGEDOWN: 34,
            BACKSPACE: 8
        };

        options = $H(AjaxLiveSearch.defaults).merge(options).toObject();

        var $input = $(options.input);
        var timeout;
        var previousValue = "";
        var hasFocus = 0;
        var lastKeyPressCode;
        var blockSubmit;

        // only opera doesn't trigger keydown multiple times while pressed, others don't work with keypress at all
        $input.observe((Prototype.Browser.Opera ? "keypress" : "keydown"), function(event) {
            // a keypress means the input has focus
            // avoids issue where input had focus before the autocomplete was applied
            hasFocus = 1;
            // track last key pressed
            lastKeyPressCode = event.keyCode;
            switch(event.keyCode) {

                case KEY.RETURN:
                    if( selectCurrent() ) {
                        // stop default to prevent a form submit, Opera needs special handling
                        event.preventDefault();
                        blockSubmit = true;
                        return false;
                    }
                    break;

                default:
                    clearTimeout(timeout);
                    timeout = setTimeout(onChange, options.delay);
                    break;
            }
        }).observe("focus" , function() {
            // track whether the field has focus, we shouldn't process any
            // results if the field no longer has focus
            hasFocus++;
        }).observe("blur" ,function() {
            hasFocus = 0;
        /*}).bind("search", function() {
            // TODO why not just specifying both arguments?
            var fn = (arguments.length > 1) ? arguments[1] : null;
            function findValueCallback(q, data) {
                var result;
                if( data && data.length ) {
                    for (var i=0; i < data.length; i++) {
                        if( data[i].result.toLowerCase() == q.toLowerCase() ) {
                            result = data[i];
                            break;
                        }
                    }
                }
                if( typeof fn == "function" ) fn(result);
                else $input.trigger("result", result && [result.data, result.value]);
            }
            $.each(trimWords($input.val()), function(i, value) {
                request(value, findValueCallback, findValueCallback);
            });
        }).bind("setOptions", function() {  // Por ahora no se soportan
            $.extend(options, arguments[1]);
            // if we've updated the data, repopulate
            if ( "data" in arguments[1] )
                cache.populate();
        }).bind("unautocomplete", function() {
            $input.unbind();
            $(input.form).unbind(".autocomplete");*/
        });

        function onChange(crap, skipPrevCheck) {

            var currentValue = $input.value;

            if ( !skipPrevCheck && currentValue == previousValue )
                return;

            previousValue = currentValue;

            //currentValue = lastWord(currentValue);
            if ( currentValue.length >= options.minChars) {
                startLoading();
                if (!options.preserveCase)
                    currentValue = currentValue.toLowerCase();
                search(currentValue);
            } else {
                stopLoading();
            }
        }

        function search(query) {
            if (options.url !== undefined) {
                new Ajax.Updater(options.updateElement, options.url, {
                    parameters: {
                        query: query
                    }
                })
            } else {
                options.searchCallback(query);
            }

        }

        // TODO Agregar estilos locos
        function startLoading() {
            //$input.addClass(options.loadingClass);
        }
        function stopLoading() {
            //$input.removeClass(options.loadingClass);
        }
    },

    defaults: {
        input: 'ajaxSearchText',
        delay: 500,
        preserveCase: false,
        minChars: 3,
        updateElement: 'results'
    }
};

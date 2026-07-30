<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<base href="{{$BASE_URL}}" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<title>.:: {{$SITE_NAME}} - {{$title}} ::.</title>
<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<!--<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>-->
<!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>-->
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/rateit.css" />

<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<style>
.black_overlay {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	bottom:0%;
	width: 100%;
	height: 320%;
	background-color: white;
	z-index:1001;
	-moz-opacity: 0.8;
	opacity:.80;
	filter: alpha(opacity=80);
}
.white_content {
	display: none;
	position: absolute;
	top: 50%;
	left: 45%;
	padding: 0px;
	border: 0px solid orange;
	background-color: white;
	z-index:1002;
	overflow: auto;
}
</style>


<!---------jquery.rateit.js contents starts ---------->

<script type="text/javascript">
/*! RateIt | v1.0.22 / 05/27/2014 | https://rateit.codeplex.com/license
    http://rateit.codeplex.com | Twitter: @gjunge
*/
(function ($) {
    $.rateit = {
        aria: {
            resetLabel: 'reset rating',
            ratingLabel: 'rating'
        }
    };

    $.fn.rateit = function (p1, p2) {
        //quick way out.
        var index = 1;
        var options = {}; var mode = 'init';
        var capitaliseFirstLetter = function (string) {
            return string.charAt(0).toUpperCase() + string.substr(1);
        };

        if (this.length === 0) { return this; }


        var tp1 = $.type(p1);
        if (tp1 == 'object' || p1 === undefined || p1 === null) {
            options = $.extend({}, $.fn.rateit.defaults, p1); //wants to init new rateit plugin(s).
        }
        else if (tp1 == 'string' && p1 !== 'reset' && p2 === undefined) {
            return this.data('rateit' + capitaliseFirstLetter(p1)); //wants to get a value.
        }
        else if (tp1 == 'string') {
            mode = 'setvalue';
        }

        return this.each(function () {
            var item = $(this);


            //shorten all the item.data('rateit-XXX'), will save space in closure compiler, will be like item.data('XXX') will become x('XXX')
            var itemdata = function (key, value) {

                if (value != null) {
                    //update aria values
                    var ariakey = 'aria-value' + ((key == 'value') ? 'now' : key);
                    var range = item.find('.rateit-range');
                    if (range.attr(ariakey) != undefined) {
                        range.attr(ariakey, value);
                    }

                }

                arguments[0] = 'rateit' + capitaliseFirstLetter(key);
                return item.data.apply(item, arguments); ////Fix for WI: 523
            };

            //handle programmatic reset
            if (p1 == 'reset') {
                var setup = itemdata('init'); //get initial value
                for (var prop in setup) {
                    item.data(prop, setup[prop]);
                }

                if (itemdata('backingfld')) { //reset also backingfield
                    var fld = $(itemdata('backingfld'));
                    fld.val(itemdata('value'));
                    fld.trigger('change');
                    if (fld[0].min) { fld[0].min = itemdata('min'); }
                    if (fld[0].max) { fld[0].max = itemdata('max'); }
                    if (fld[0].step) { fld[0].step = itemdata('step'); }
                }
                item.trigger('reset');
            }

            //add the rate it class.
            if (!item.hasClass('rateit')) { item.addClass('rateit'); }

            var ltr = item.css('direction') != 'rtl';

            // set value mode
            if (mode == 'setvalue') {
                if (!itemdata('init')) { throw 'Can\'t set value before init'; }


                //if readonly now and it wasn't readonly, remove the eventhandlers.
                if (p1 == 'readonly' && p2 == true && !itemdata('readonly')) {
                    item.find('.rateit-range').unbind();
                    itemdata('wired', false);
                }
                //when we receive a null value, reset the score to its min value.
                if (p1 == 'value') {
                    p2 = (p2 == null) ? itemdata('min') : Math.max(itemdata('min'), Math.min(itemdata('max'), p2));
                }
                if (itemdata('backingfld')) {
                    //if we have a backing field, check which fields we should update. 
                    //In case of input[type=range], although we did read its attributes even in browsers that don't support it (using fld.attr())
                    //we only update it in browser that support it (&& fld[0].min only works in supporting browsers), not only does it save us from checking if it is range input type, it also is unnecessary.
                    var fld = $(itemdata('backingfld'));
                    if (p1 == 'value') { fld.val(p2); }
                    if (p1 == 'min' && fld[0].min) { fld[0].min = p2; }
                    if (p1 == 'max' && fld[0].max) { fld[0].max = p2;  }
                    if (p1 == 'step' && fld[0].step) { fld[0].step = p2; }
                }

                itemdata(p1, p2);
            }

            //init rateit plugin
            if (!itemdata('init')) {

                //get our values, either from the data-* html5 attribute or from the options.
                itemdata('min', isNaN(itemdata('min')) ? options.min : itemdata('min'));
                itemdata('max', isNaN(itemdata('max')) ? options.max : itemdata('max'));
                itemdata('step', itemdata('step') || options.step);
                itemdata('readonly', itemdata('readonly') !== undefined ? itemdata('readonly') : options.readonly);
                itemdata('resetable', itemdata('resetable') !== undefined ? itemdata('resetable') : options.resetable);
                itemdata('backingfld', itemdata('backingfld') || options.backingfld);
                itemdata('starwidth', itemdata('starwidth') || options.starwidth);
                itemdata('starheight', itemdata('starheight') || options.starheight);
                itemdata('value', Math.max(itemdata('min'), Math.min(itemdata('max'), (!isNaN(itemdata('value')) ? itemdata('value') : (!isNaN(options.value) ? options.value : options.min)))));
                itemdata('ispreset', itemdata('ispreset') !== undefined ? itemdata('ispreset') : options.ispreset);
                //are we LTR or RTL?

                if (itemdata('backingfld')) {
                    //if we have a backing field, hide it, override defaults if range or select.
                    var fld = $(itemdata('backingfld')).hide();

                    if (fld.attr('disabled') || fld.attr('readonly')) {
                        itemdata('readonly', true); //http://rateit.codeplex.com/discussions/362055 , if a backing field is disabled or readonly at instantiation, make rateit readonly.
                    }

                    if (fld[0].nodeName == 'INPUT') {
                        if (fld[0].type == 'range' || fld[0].type == 'text') { //in browsers not support the range type, it defaults to text

                            itemdata('min', parseInt(fld.attr('min')) || itemdata('min')); //if we would have done fld[0].min it wouldn't have worked in browsers not supporting the range type.
                            itemdata('max', parseInt(fld.attr('max')) || itemdata('max'));
                            itemdata('step', parseInt(fld.attr('step')) || itemdata('step'));
                        }
                    }
                    if (fld[0].nodeName == 'SELECT' && fld[0].options.length > 1) {
                        itemdata('min', (!isNaN(itemdata('min')) ? itemdata('min') : Number(fld[0].options[0].value)));
                        itemdata('max', Number(fld[0].options[fld[0].length - 1].value));
                        itemdata('step', Number(fld[0].options[1].value) - Number(fld[0].options[0].value));
                        //see if we have a option that as explicity been selected
                        var selectedOption = fld.find('option[selected]');
                        if (selectedOption.length == 1) {
                            itemdata('value', selectedOption.val());
                        }
                    }
                    else {
                        //if it is not a select box, we can get's it's value using the val function. 
                        //If it is a selectbox, we always get a value (the first one of the list), even if it was not explicity set.
                        itemdata('value', fld.val());
                    }
                }

                //Create the necessary tags. For ARIA purposes we need to give the items an ID. So we use an internal index to create unique ids
                var element = item[0].nodeName == 'DIV' ? 'div' : 'span';
                index++;
              

			var html = '<button id="rateit-reset-index" type="button" data-role="none" class="rateit-reset" aria-label="' + $.rateit.aria.resetLabel + '" aria-controls="rateit-range-index"></button><element id="rateit-range-index" class="rateit-range" tabindex="0" role="slider" aria-label="' + $.rateit.aria.ratingLabel + '" aria-owns="rateit-reset-index" aria-valuemin="' + itemdata('min') + '" aria-valuemax="' + itemdata('max') + '" aria-valuenow="' + itemdata('value') + '"><element class="rateit-selected" style="height:' + itemdata('starheight') + 'px"></element><element class="rateit-hover" style="height:' + itemdata('starheight') + 'px"></element></element>';
                item.append(html.replace(/index/gi, index).replace(/element/gi, element));

                //if we are in RTL mode, we have to change the float of the "reset button"
                if (!ltr) {
                    item.find('.rateit-reset').css('float', 'right');
                    item.find('.rateit-selected').addClass('rateit-selected-rtl');
                    item.find('.rateit-hover').addClass('rateit-hover-rtl');
                }

                itemdata('init', JSON.parse(JSON.stringify(item.data()))); //cheap way to create a clone
            }
            //resize the height of all elements, 
            item.find('.rateit-selected, .rateit-hover').height(itemdata('starheight'));

            //set the range element to fit all the stars.
            var range = item.find('.rateit-range');
            range.width(itemdata('starwidth') * (itemdata('max') - itemdata('min'))).height(itemdata('starheight'));


            //add/remove the preset class
            var presetclass = 'rateit-preset' + ((ltr) ? '' : '-rtl');
            if (itemdata('ispreset')) {
                item.find('.rateit-selected').addClass(presetclass);
            }
            else {
                item.find('.rateit-selected').removeClass(presetclass);
            }

            //set the value if we have it.
            if (itemdata('value') != null) {
                var score = (itemdata('value') - itemdata('min')) * itemdata('starwidth');
                item.find('.rateit-selected').width(score);
            }

            //setup the reset button
            var resetbtn = item.find('.rateit-reset');
            if (resetbtn.data('wired') !== true) {
                resetbtn.bind('click', function (e) {
                    e.preventDefault();

                    resetbtn.blur();

                    var event = $.Event('beforereset');
                    item.trigger(event);
                    if (event.isDefaultPrevented()) {
                        return false;
                    }

                    item.rateit('value', null);
                    item.trigger('reset');
                }).data('wired', true);

            }

            //this function calculates the score based on the current position of the mouse.
            var calcRawScore = function (element, event) {
                var pageX = (event.changedTouches) ? event.changedTouches[0].pageX : event.pageX;

                var offsetx = pageX - $(element).offset().left;
                if (!ltr) { offsetx = range.width() - offsetx };
                if (offsetx > range.width()) { offsetx = range.width(); }
                if (offsetx < 0) { offsetx = 0; }

                return score = Math.ceil(offsetx / itemdata('starwidth') * (1 / itemdata('step')));
            };

            //sets the hover element based on the score.
            var setHover = function (score) {
                var w = score * itemdata('starwidth') * itemdata('step');
                var h = range.find('.rateit-hover');
                if (h.data('width') != w) {
                    range.find('.rateit-selected').hide();
                    h.width(w).show().data('width', w);
                    var data = [(score * itemdata('step')) + itemdata('min')];
                    item.trigger('hover', data).trigger('over', data);
                }
            };

            var setSelection = function (value) {
                var event = $.Event('beforerated');
                item.trigger(event, [value]);
                if (event.isDefaultPrevented()) {
                    return false;
                }

                itemdata('value', value);
                if (itemdata('backingfld')) {
                    $(itemdata('backingfld')).val(value).trigger('change');
                }
                if (itemdata('ispreset')) { //if it was a preset value, unset that.
                    range.find('.rateit-selected').removeClass(presetclass);
                    itemdata('ispreset', false);
                }
                range.find('.rateit-hover').hide();
                range.find('.rateit-selected').width(value * itemdata('starwidth') - (itemdata('min') * itemdata('starwidth'))).show();
                item.trigger('hover', [null]).trigger('over', [null]).trigger('rated', [value]);
                return true;
            };

            if (!itemdata('readonly')) {
                //if we are not read only, add all the events

                //if we have a reset button, set the event handler.
                if (!itemdata('resetable')) {
                    resetbtn.hide();
                }

                //when the mouse goes over the range element, we set the "hover" stars.
                if (!itemdata('wired')) {
                    range.bind('touchmove touchend', touchHandler); //bind touch events
                    range.mousemove(function (e) {
                        var score = calcRawScore(this, e);
                        setHover(score);
                    });
                    //when the mouse leaves the range, we have to hide the hover stars, and show the current value.
                    range.mouseleave(function (e) {
                        range.find('.rateit-hover').hide().width(0).data('width', '');
                        item.trigger('hover', [null]).trigger('over', [null]);
                        range.find('.rateit-selected').show();
                    });
                    //when we click on the range, we have to set the value, hide the hover.
                    range.mouseup(function (e) {
                        var score = calcRawScore(this, e);
                        var value = (score * itemdata('step')) + itemdata('min');
                        setSelection(value);
                        range.blur();
                    });

                    //support key nav
                    range.keyup(function (e) {
                        if (e.which == 38 || e.which == (ltr ? 39 : 37)) {
                            setSelection(Math.min(itemdata('value') + itemdata('step'), itemdata('max')));
                        }
                        if (e.which == 40 || e.which == (ltr ? 37 : 39)) {
                            setSelection(Math.max(itemdata('value') - itemdata('step'), itemdata('min')));
                        }
                    });

                    itemdata('wired', true);
                }
                if (itemdata('resetable')) {
                    resetbtn.show();
                }
            }
            else {
                resetbtn.hide();
            }

            range.attr('aria-readonly', itemdata('readonly'));
        });
    };

    //touch converter http://ross.posterous.com/2008/08/19/iphone-touch-events-in-javascript/
    function touchHandler(event) {

        var touches = event.originalEvent.changedTouches,
                first = touches[0],
                type = "";
        switch (event.type) {
            case "touchmove": type = "mousemove"; break;
            case "touchend": type = "mouseup"; break;
            default: return;
        }

        var simulatedEvent = document.createEvent("MouseEvent");
        simulatedEvent.initMouseEvent(type, true, true, window, 1,
                              first.screenX, first.screenY,
                              first.clientX, first.clientY, false,
                              false, false, false, 0/*left*/, null);

        first.target.dispatchEvent(simulatedEvent);
        event.preventDefault();
    };

    //some default values.
    $.fn.rateit.defaults = { min: 0, max: 5, step: 1, starwidth: 16, starheight: 16, readonly: false, resetable: true, ispreset: false };

    //invoke it on all .rateit elements. This could be removed if not wanted.
    $(function () { $('div.rateit, span.rateit').rateit(); });

})(jQuery);

</script>

<!---------jquery.rateit.js contents ends ---------->



<script type="text/javascript">
    function set_null(){alert("null")};
	
	function setcustvalue(cust_id, cust_name)
		{
		document.getElementById("dt_name").value = cust_name;
		document.getElementById("dt_id").value = cust_id;
		document.getElementById('divcustomersInfo').style.visibility = 'hidden';
		}
		
function popupWindow(o,d)
      {
        // o - Object to display.
        // d - Display, true =  display, false = hide
      
        var obj = document.getElementById(o);
        if(d)
          obj.style.display = 'block';
        else
          obj.style.display = 'none';
      }
	
function closediv()
		{
		document.getElementById('divcustomersInfo').style.visibility = 'hidden';
		}		
		 var getcurrenturl = "{{$BASE_URL}}customer.common?a_req=";
		  var getsendurl = "{{$BASE_URL}}business.common?a_req=";
   
	    var urlsale = "{{$BASE_URL}}{{$XFA.cust_list}}?cust_name="; // The server-side script
		
			
		 function handleHttpResponsesetcurdate() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=ltrim(http.responseText);				  
			  if(results !='')
				  	{
					var new_array = new Array();
				  	var new_array=results.split("|"); 
					var v1 = ltrim(new_array[0]);
					var v2 = new_array[1];
					var v3 = ltrim(new_array[2]);
					var v4 = new_array[3];
					document.getElementById(v1).value = v2;
					document.getElementById(v3).value = v4;	
					parent.closeTop();
					return true;
					}
            }
          }
        }
		
		function setcurdate(a,b,c) {   
		   var sId = b;
		    getdateurl2 = getcurrenturl + escape(a) + '&b=' + escape(sId)+ '&t_id=' + c + "&random=" + Math.random();
            http.open("GET", getdateurl2, true);
            http.onreadystatechange = handleHttpResponsesetcurdate;
            http.send(null);	
			parent.showTop();
        }
		
	
	function handleHttpcustomersResponse2() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;
				  document.getElementById('divcustomersInfo').style.visibility = 'hidden';
			  if(results !='')
			  	{ document.getElementById('divcustomersInfo').innerHTML = results;
				document.getElementById('divcustomersInfo').style.visibility = 'visible';
				parent.closeTop();}
            }
          }
        }
       
      function requestcustomersInfo() {     
            var sId = document.getElementById("dt_name").value;
			var custurl =urlsale + escape(sId)+ "&random=" + Math.random();
            http.open("GET", custurl, true);
			http.onreadystatechange = handleHttpcustomersResponse2;
            http.send(null);
			parent.showTop();
        }	
		
		////////////////////// Hot Buttons //////////////////
	  function handleHttpcustomersResponse() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;
			  if(results !='')
			  	{ 
					parent.closeTop();
					if(results == '1000')
						{
						alert("E Dossiers not send because buyer hasn't signed deed of confidentiality.");	
						}else{
						alert("Email has been sent successfully.");						
						}
				}
            }
          }
        }
       
      function requestSend(req) {  
			if (confirm("Are you sure want to send.") == true)
		   		{
            var cId = document.getElementById("dt_id").value;
			var bId = document.getElementById("beb_id").value;
			var edl_be_id = document.getElementById("edt_id").value;
			var  getdateurlGD = getsendurl + escape(req) + '&cust_id=' + escape(cId)+ '&bus_id=' + escape(bId)+ '&edl_be_id=' + escape(edl_be_id) + "&random=" + Math.random();
		    http.open("GET", getdateurlGD, true);
            http.onreadystatechange = handleHttpcustomersResponse;
            http.send(null);
			parent.showTop();
			}
        }
		////////////////////// Hot Buttons //////////////////
		
		function change_status()
			{
			var beid = $('#edt_id').val();
				if(beid)
					{
						if(confirm("Are you sure want to change status.")){
						$('#green').hide('slow');
						var besid = $('#be_status option:selected').val();
							$.get(getsendurl + 'ChangeSt&beid='+beid+'&besid='+besid, function(data) {
							if(data == 1){ $('#green').show('slow'); }
							});
						}
					}
			}
		
		////////////////////// Hot Buttons Edit and Send Start//////////////////
		function requestEditSend(opr) {   
		   var sId = document.getElementById("dt_id").value;
		   var url = '{{$BASE_URL}}business.email/opr/'+ opr +'/cust_id/'+sId; 
			parent.popup(url); 	
        }
		////////////////////// Hot Buttons Edit and  Send End //////////////////	
			
function getHTTPObject() {
  var xmlhttp;

  if(window.XMLHttpRequest){
    xmlhttp = new XMLHttpRequest();
  }
  else if (window.ActiveXObject){
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    if (!xmlhttp){
        xmlhttp=new ActiveXObject("Msxml2.XMLHTTP");
    	}
	}
  return xmlhttp; 
}
var http = getHTTPObject(); // We create the HTTP Object	

</script>
{{if $msg != 0}}
<script type="text/javascript">
	parent.requestbusenquiryInfo(1);
   </script>
<script type="text/javascript">
	parent.$.fancybox.close();
   </script>
{{/if}}
   {{if $msg != 0}}
<script type="text/javascript">
	parent.toggleLayer('divbyersaleenquiry','addenq');
	closeTop();
   </script>
{{/if}}


<!--<script type="text/javascript" src="http://www.google.com/jsapi"></script>-->
<!-- Load TinyMCE -->
<script type="text/javascript" src="{{$BASE_URL}}js/tiny_mce/jquery.tinymce.js"></script>
<script type="text/javascript">
	$().ready(function() {
		$('textarea.tinymce').tinymce({
			// Location of TinyMCE script
			script_url : '{{$BASE_URL}}js/tiny_mce/tiny_mce.js',

			// General options
			theme : "advanced",
			plugins : "autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,advlist",

			// Theme options
			theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
			theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
			theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
			theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak",
			theme_advanced_toolbar_location : "top",
			theme_advanced_toolbar_align : "left",
			theme_advanced_statusbar_location : "bottom",
			theme_advanced_resizing : true,
			file_browser_callback : "ajaxfilemanager",
						// Example content CSS (should be your site CSS)
			content_css : "{{$BASE_URL}}css/default/content.css",

			// Drop lists for link/image/media/template dialogs
			template_external_list_url : "lists/template_list.js",
			external_link_list_url : "lists/link_list.js",
			external_image_list_url : "lists/image_list.js",
			media_external_list_url : "lists/media_list.js",

			// Replace values for the template plugin
			template_replace_values : {
				username : "Some User",
				staffid : "991234"
			}
		});
	});
	
function ajaxfilemanager(field_name, url, type, win) {
			var ajaxfilemanagerurl = "{{$BASE_URL}}js/tiny_mce/plugins/ajaxfilemanager/ajaxfilemanager.php";
			var view = 'detail';
			switch (type) {
				case "image":
				view = 'thumbnail';
					break;
				case "media":
					break;
				case "flash": 
					break;
				case "file":
					break;
				default:
					return false;
			}
            tinyMCE.activeEditor.windowManager.open({
                url: "{{$BASE_URL}}js/tiny_mce/plugins/ajaxfilemanager/ajaxfilemanager.php?view=" + view,
                width: 782,
                height: 440,
                inline : "yes",
                close_previous : "no"
            },{
                window : win,
                input : field_name
            });
			            return false;			
			var fileBrowserWindow = new Array();
			fileBrowserWindow["file"] = ajaxfilemanagerurl;
			fileBrowserWindow["title"] = "Ajax File Manager";
			fileBrowserWindow["width"] = "782";
			fileBrowserWindow["height"] = "440";
			fileBrowserWindow["close_previous"] = "yes";
			tinyMCE.openWindow(fileBrowserWindow, {
			  window : win,
			  input : field_name,
			  resizable : "yes",
			  inline : "yes",
			  editor_id : tinyMCE.getWindowArg("editor_id")
			});
			
			return false;

			}
</script>
<!-- /TinyMCE -->
    

</head>
<!--<body bgcolor="#FFFFFF" onClick = closediv();>-->
<body bgcolor="#FFFFFF">
<table width="100%" id="none-table" style="background-color:#FFFFFF;">
  <form name="detail" method="post" action="{{$XFA.businessenquiry_detail}}" enctype="multipart/form-data" onsubmit="showTop();return false;">

   
    <tr>
      <td colspan="2"><table width="100%" border="1" style="background-color:#FFFFFF;">
          <tr>
            <th colspan="4"><div class="sub_heading">Email Advice Sent To Seller</div></th>
          </tr>
          <tr>
            <td width="150">Created Date:</td>
            <th width="330"> <input type="text" name="{{$TABLE}}[be_easts_date]" value="{{$detail.be_easts_date|date_format:'%d-%m-%Y'}}" style="width:80px;" id="demo9" readonly="readonly" class="w16em dateformat-d-ds-m-ds-Y"/>
              &nbsp;
              <input type="text" name="{{$TABLE}}[be_easts_time]" value="{{$detail.be_easts_time}}" style="width:40px;" id="be_easts_time" />
              &nbsp;<a href="javascript:setcurdate('curdate','demo9','be_easts_time');" title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="System Date" /></a> </th>
            <td >User:&nbsp;</td>
            <th width="400">{{$detail.buse_email_advice_sent_to_seller_username}}
              <input type="hidden"  name="{{$TABLE}}[be_easts_user]" value="{{$detail.buse_email_advice_sent_to_seller_user|default:$user_id}}" class="lrg" /></th>
          </tr>
          <tr>
            <td>Comment:&nbsp;</td>
            <th colspan="3"> <textarea rows="5" cols="80" name="{{$TABLE}}[be_easts_comments]" id="be_easts_user">{{$detail.be_easts_comments}}</textarea></th>
          </tr>
          
            <tr>
      <td width="150">Ip Address:&nbsp;</td>
      <th><input type="text" style="width:250px;" name="{{$TABLE}}[be_ip]" value="{{$detail.be_ip}}" /> </th>
      <td>
      <div> Buyer Enquiry Rating </div>
            <div data-productid="{{$cust_id}}" class="rateit" data-rateit-value="{{$detail.be_rating_score}}" style="text-align:left; padding-bottom:10px;padding-top:10px;"></div><br>
        
            <script type="text/javascript">
                var tooltipvalues = ['Very poor', 'Poor', 'Medium', 'Good', 'Very good'];
                $(".rateit").bind('over', function (event, value) { $(this).attr('title', tooltipvalues[value - 1]); });
            </script>
            <input type="hidden" name="{{$TABLE}}[be_rating_score]" value="{{$detail.be_rating_score}}" id="score" >
      </td>
    </tr>
        </table></td>
    </tr>
    <tr>
      <td colspan="2"><div align="left">
          <input type="submit" name="subAddDetail" value="{{$button}}" class="sml"/>&nbsp;
          <input type="button" name="cancel" value="Cancel" onclick="javascript:parent.add_edit_business_enquiry();" class="sml"/>
          </div></td>
    </tr>
  </form>
</table>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("{{$TABLE}}[buse_cust_name]","req", "Please specify Customer Name.");
</script>

 <hr />
<!--<p style="font-size:15px; font-weight:bold; font-family:Verdana, Arial, Helvetica, sans-serif; color:#000000;">   
Buyer Story </p>
<textarea cols = '150' rows="4">{{$detail.be_buyer_story}}</textarea>  
</div>-->

<p style="font-size:15px; font-weight:bold; font-family:Verdana, Arial, Helvetica, sans-serif; color:#000000; vertical-align:top;" > Add Inspection
  <input type="button" name="add_inspection" value="Add new"  onClick="document.location.href='{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/bsn_id/{{$bsn_id}}/buse_id/{{$buse_id}}/action/showinspection'"/>
</p>
{{if $inspectionlist}}
<table cellpadding="3" cellspacing="3" width="98%" id="list-table" border="0">
  <tr bgcolor="#CCCCCC">
    <th>Action</th>
    <th>Cerate Date</th>
    <th>Comments</th>
  </tr>
  {{foreach from=$inspectionlist key="key" item="item"}}
  <tr>
    <td width="10%"><a href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/cust_id/{{$cust_id}}/bod_id/{{$item.bod_id}}/buse_id/{{$buse_id}}"  title="Edit"> <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp; <a href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/cust_id/{{$cust_id}}/bod_id/{{$item.bod_id}}/buse_id/{{$buse_id}}/insdelete/1" onClick="javascript:if(!confirm('Are you sure you want to delete.?')) return false;"  title="Delete"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a></td>
    <td>{{$item.bod_cur_date|date_format:"%d-%m-%Y"}}</td>
    <td width="80%">{{$item.bod_body}}</td>
  </tr>
  {{/foreach}}
</table>
{{if $inspectionlist}}
<table width="90%" border="0" cellpadding="0" cellspacing="0" align="center" style="border:none; font-size:11px;">
  <tr> {{if $inslast > 1}}
    <td align="center"><div class='pagination'> {{if $inspagenum == 1}} <span class='disabled'>&laquo; previous</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/cust_id/{{$cust_id}}/buse_id/{{$buse_id}}/inspagenum/{{$inspage_num}}{{math equation="x - y" x=$inspagenum y=1}}" title="Previous">&laquo; previous</a> {{/if}}
        
        {{if $inspagenum != 1}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/cust_id/{{$cust_id}}/buse_id/{{$buse_id}}/inspagenum/1" title="1 Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $inspagenum != 2}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/cust_id/{{$cust_id}}/buse_id/{{$buse_id}}/inspagenum/2" title="2 Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
        {{if $inspaginateprev.0 > 3}}
        ...
        {{/if}}
        {{foreach from=$inspaginateprev key="page_key" item="page_num"}}
        {{if $inspage_num == $inspagenum OR $inspage_num <= 2}}
        {{elseif $inspage_num == $inslastone}}
        
        {{else}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/cust_id/{{$cust_id}}/buse_id/{{$buse_id}}/inspagenum/{{$inspage_num}}" title="{{$inspage_num}} Page">{{$inspage_num}}</a></span> {{/if}}
        {{/foreach}}
        
        {{foreach from=$inspaginatenext key="page_key" item="page_num2"}}
        {{if $inspage_num2 < $last AND $inspage_num2 != $inslastone}}
        {{if $inspage_num2 == 1}}
        {{elseif $inspage_num2 == 2}}
        {{else}}
        {{if $inspage_num2 == $inspagenum OR $inspage_num2 <= 0}} <span class='current'> {{$inspage_num2}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/cust_id/{{$cust_id}}/buse_id/{{$buse_id}}/inspagenum/{{$inspage_num2}}" title="{{$inspage_num2}} Page">{{$page_num2}}</a> {{/if}}
        {{/if}}     
        {{/if}}
        {{/foreach}}
        {{if $inspage_num2 < $inslasttow}}
        ...
        {{/if}}
        {{if $inslastone == 1}}
        {{elseif $inslastone == 2}}
        {{else}}
        {{if $inspagenum == $inslastone }} <span class='current'>{{$inslastone}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/cust_id/{{$cust_id}}/buse_id/{{$buse_id}}/inspagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
        {{/if}}
        {{if $inslast == 1}}
        {{elseif $inslast == 2}}
        {{else}}
        {{if $inspagenum == $inslast}} <span class='current'>{{$inslast}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/cust_id/{{$cust_id}}/buse_id/{{$buse_id}}/inspagenum/{{$inslast}}" title="{{$inslast}} Page">{{$inslast}}</a> {{/if}}
        {{/if}}
        {{if $inspagenum == $inslast}} <span class='disabled'>next &raquo;</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/cust_id/{{$cust_id}}/buse_id/{{$buse_id}}/inspagenum/{{math equation="x + y" x=$inspagenum y=1}}" title="Next">next &raquo;</a></div>
      {{/if}} </td>
    {{/if}} </tr>
</table>
{{/if}}   
{{/if}}

<div>
  <hr />
</div>
<div>
  <hr />
</div>
<p style="font-size:15px; font-weight:bold; font-family:Verdana, Arial, Helvetica, sans-serif; color:#000000;"> Add Make Offer
  <input type="button" name="add_foolowup" value="Add new"  onClick="document.location.href='{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/bsn_id/{{$bsn_id}}/buse_id/{{$buse_id}}/action/showmakeoffer'"/>
</p>



<div>
  <hr />
</div>
<p style="font-size:15px; font-weight:bold; font-family:Verdana, Arial, Helvetica, sans-serif; color:#000000;"> Add information Request
  <input type="button" name="add_foolowup" value="Add new"  onClick="document.location.href='{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/bsn_id/{{$bsn_id}}/buse_id/{{$buse_id}}/action/showinfor'"/>
</p>
{{if $inforlist}}
<table cellpadding="3" cellspacing="3" width="98%" id="list-table" border="0">
  <tr bgcolor="#CCCCCC">
    <th>Action</th>
    <th>Cerate Date</th>
    <th>Comments</th>
  </tr>
  {{foreach from=$inforlist key="key" item="item"}}
  <tr>
    <td width="10%"><a href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/cust_id/{{$cust_id}}/bod_id/{{$item.bod_id}}/buse_id/{{$buse_id}}"  title="Edit"> <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp; <a href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/cust_id/{{$cust_id}}/bod_id/{{$item.bod_id}}/buse_id/{{$buse_id}}/insdelete/1" onClick="javascript:if(!confirm('Are you sure you want to delete.?')) return false;"  title="Delete"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a></td>
    <td>{{$item.bod_cur_date|date_format:"%d-%m-%Y"}}</td>
    <td width="80%">{{$item.bod_body}}</td>
  </tr>
  {{/foreach}}
</table>
{{if $inforlist}}
<table width="90%" border="0" cellpadding="0" cellspacing="0" align="center" style="border:none; font-size:11px;">
  <tr> {{if $inforlast > 1}}
    <td align="center"><div class='pagination'> {{if $inforpagenum == 1}} <span class='disabled'>&laquo; previous</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/cust_id/{{$cust_id}}/buse_id/{{$buse_id}}/inforpagenum/{{$inforpage_num}}{{math equation="x - y" x=$inforpagenum y=1}}" title="Previous">&laquo; previous</a> {{/if}}
        
        {{if $inforpagenum != 1}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/cust_id/{{$cust_id}}/buse_id/{{$buse_id}}/inforpagenum/1" title="1 Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $inforpagenum != 2}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/cust_id/{{$cust_id}}/buse_id/{{$buse_id}}/inforpagenum/2" title="2 Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
        {{if $inforpaginateprev.0 > 3}}
        ...
        {{/if}}
        {{foreach from=$inforpaginateprev key="page_key" item="page_num"}}
        {{if $inforpage_num == $inforpagenum OR $inforpage_num <= 2}}
        {{elseif $inforpage_num == $inforlastone}}
        
        {{else}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/cust_id/{{$cust_id}}/buse_id/{{$buse_id}}/inforpagenum/{{$inforpage_num}}" title="{{$inforpage_num}} Page">{{$inforpage_num}}</a></span> {{/if}}
        {{/foreach}}
        
        {{foreach from=$inforpaginatenext key="page_key" item="page_num2"}}
        {{if $inforpage_num2 < $last AND $inforpage_num2 != $inforlastone}}
        {{if $inforpage_num2 == 1}}
        {{elseif $inforpage_num2 == 2}}
        {{else}}
        {{if $inforpage_num2 == $inforpagenum OR $inforpage_num2 <= 0}} <span class='current'> {{$inforpage_num2}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/cust_id/{{$cust_id}}/buse_id/{{$buse_id}}/inforpagenum/{{$inforpage_num2}}" title="{{$inforpage_num2}} Page">{{$page_num2}}</a> {{/if}}
        {{/if}}     
        {{/if}}
        {{/foreach}}
        {{if $inforpage_num2 < $inforlasttow}}
        ...
        {{/if}}
        {{if $inforlastone == 1}}
        {{elseif $inforlastone == 2}}
        {{else}}
        {{if $inforpagenum == $inforlastone }} <span class='current'>{{$inforlastone}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/cust_id/{{$cust_id}}/buse_id/{{$buse_id}}/inforpagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
        {{/if}}
        {{if $inforlast == 1}}
        {{elseif $inforlast == 2}}
        {{else}}
        {{if $inforpagenum == $inforlast}} <span class='current'>{{$inforlast}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/cust_id/{{$cust_id}}/buse_id/{{$buse_id}}/inforpagenum/{{$inforlast}}" title="{{$inforlast}} Page">{{$inforlast}}</a> {{/if}}
        {{/if}}
        {{if $inforpagenum == $inforlast}} <span class='disabled'>next &raquo;</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/cust_id/{{$cust_id}}/buse_id/{{$buse_id}}/inforpagenum/{{math equation="x + y" x=$inforpagenum y=1}}" title="Next">next &raquo;</a></div>
      {{/if}} </td>
    {{/if}} </tr>
</table>
{{/if}}   
{{/if}}
{{if $action == 'showinfor'}}
<form name="buyer_followup" action="" method="post" >
  <input type="hidden" name="{{$TABLE}}[bod_cust_id]" value="{{$cust_id}}" />
  <input type="hidden" name="{{$TABLE}}[bod_be_id]" value="{{$buse_id}}" />
  <input type="hidden" name="{{$TABLE}}[bod_id]" value="{{$insdata.bod_id}}" />
  <input type="hidden" name="{{$TABLE}}[bod_bus_id]" value="{{$detail.bsn_id}}" />
  <table border="0" width="90%" id="emp-table">
    <tr>
      <th width="200">&nbsp;Information Request Text</th>
      <td ><textarea cols="100" rows="4" name="{{$TABLE}}[bod_body]">{{$insdata.bod_body}}</textarea>
      </td>
    </tr>
    <tr>
      <th colspan="2"><div align="right">
          <input type="submit" name="addinforeq" value="{{$inforbutton}}" >
        </div></th>
    </tr>
  </table>
</form>
{{/if}}
<div>
  <hr />
  <div>
  <table cellpadding="0" cellspacing="0" border="0" >
  	<tr><td class="hotbuttons"><a href="javascript:requestSend('GDSend');" class="buttonyellow">GD Reminder</a></td>
    	<td class="hotbuttons"><a href="javascript:requestSend('BSurvey');" class="buttonred">Buyer Survey</a></td>
        <td class="hotbuttons"><a href="javascript:requestSend('BFinance');" class="buttonsky">Buyer Finance</a></td>
    	<td class="hotbuttons" rowspan="2" colspan="2" ><a href="javascript:requestSend('MListing');" class="buttonbiggreen">Monthly Listing</a></td>
    </tr>
      	<tr><td class="hotbuttons"><a href="javascript:requestEditSend('gd');" class="buttonyellow">EDIT & SEND</a></td>
    	<td class="hotbuttons"><a href="javascript:requestEditSend('BSurvey');" class="buttonred">EDIT & SEND</a></td>
        <td class="hotbuttons"><a href="javascript:requestEditSend('BFinance');" class="buttonsky">EDIT & SEND</a></td>
    	
    </tr>
    <tr><td colspan="2">&nbsp;</td></tr>
  	<tr><td class="hotbuttons"><a href="javascript:requestSend('BQuestion');" class="buttonblue">Business Question</a></td>
    	<td class="hotbuttons"><a href="javascript:requestSend('BInfo');" class="buttonbrown">Free Buyer Info</a></td>
        <td class="hotbuttons" rowspan="2" colspan="2"><a href="javascript:requestSend('RDossier');" class="buttonbigblack">RESEND DOSSIER</a>
        </td>
    	
    </tr>
      	<tr><td class="hotbuttons"><a href="javascript:requestEditSend('BQuestion');" class="buttonblue">EDIT & SEND</a></td>
    	<td class="hotbuttons"><a href="javascript:requestEditSend('BInfo');" class="buttonbrown">EDIT & SEND</a></td>
       
    	<td class="hotbuttons" rowspan="2" colspan="2"></td>
    </tr>
  </table>
  </div>
</div>

  <script type="text/javascript">
               
                $('.rateit').bind('rated reset', function (e) {
                    var ri = $(this);

                    var value = ri.rateit('value');
		
					$("#score").val(value);
					$("#score1").val(value);
                    var productID = ri.data('productid'); 
                    //ri.rateit('readonly', true);
					//alert("Your rating has been submitted");
                    $.ajax({
                        url: '{{$BASE_URL}}customer.rateit', 		//your server side script
                        data: { id: productID, value: value }, //our data
                        type: 'POST',
                        success: function (data) {
                            $('#response').append('<li>' + data + '</li>');

                        },
                        error: function (jxhr, msg, err) {
                            $('#response').append('<li style="color:red">' + msg + '</li>');
                        }
                    });
                });
            </script>
</body>



<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/rangeslider/rangeSlider.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/rangeslider/rangeSlider.js"></script>

<!--Ajax Common function-->
<script type="text/javascript">
 
	    var geturl= "{{$BASE_URL}}recruitment_list.doclist/mid/"; // The server-side script
		var getdelurl= "{{$BASE_URL}}recruitment_list.docdelete/mid/"; // The server-side script
   		
	function show_wait()	
				{
				document.getElementById('doc_list').innerHTML= '<div id="loading_div"></div>';
				document.getElementById('loading_div').style.visibility = 'visible';
				
				
				}	
		function close_wait()	
				{
				document.getElementById('loading_div').style.visibility = 'hidden';
				
				}			
	function handleHttpAllBusinessResponse() {   
        if (http.readyState == 4) {
              if(http.status == 200) {
                  var results=http.responseText;    			  
			  if(results !='')
			  	{document.getElementById('doc_list').style.visibility = 'visible';
				 document.getElementById('doc_list').innerHTML = results;
				 close_wait();
				}
            }
          }
        }
       
        function show_doclist() { 
			var dochubid = document.getElementById('dh_id').value;
			var docurl = geturl + dochubid+"/random/" + Math.random();
			http.open("GET", docurl, true);
            http.onreadystatechange = handleHttpAllBusinessResponse;
            http.send(null);
			show_wait();
	    }

function handleHttpfileResponse() {   
        if (http.readyState == 4) {
              if(http.status == 200) {
                  var results=http.responseText;    			  
			  if(results !='')
			  	{
					show_doclist();
					close_wait();	
				}
            }
          }
        }
       
        function delete_docfile(id,doc) { 
		if(!confirm('Are you sure want to delete.')) return ;
    		var docurl = getdelurl + id+"/doc/"+doc+"/random=" + Math.random();
			http.open("GET", docurl, true);
            http.onreadystatechange = handleHttpfileResponse;
            http.send(null);
			show_wait();	
        }


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
			var http = getHTTPObject(); 
// We create the HTTP Object
{{if $detail.$ID}}
setTimeout('show_doclist();', 500);
{{/if}}
</script>

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);

</script>
{{/if}}

<div align="center">
<h3 class="page-title">{{$title}}</h3>
   							
   
   {{if !$opr}}
   
 <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
 <input type="hidden" name="recruitment[re_id]" value="{{$detail.$ID}}" id="dh_id"/>
     <table id="viewdoc-table" width="100%" cellpadding="0" cellspacing="0">
     
        <tr>
            <th> Name:</th>
            <td> <input type="text" name="recruitment[re_name]" value="{{$detail.re_name}}" style="width:500px;"/></td>
        </tr>
        
        <tr>
            <th> Phone:</th>
            <td> <input type="text" name="recruitment[re_phone]" value="{{$detail.re_phone}}" style="width:300px;"/></td>
        </tr>
       
        <tr>
            <th> Email:</th>
            <td> <input type="text" name="recruitment[re_email]" value="{{$detail.re_email}}" style="width:300px;"/></td>
        </tr> 
        <tr>
            <th> Date:</th>
            <td> <input type="text" name="recruitment[re_date]" value="{{$detail.re_date}}" class="w16em dateformat-d-ds-m-ds-Y" id="demo4" maxlength="25" readonly="readonly"/></td>
        </tr>
        
       <tr>
            <th> Position:</th>
            <td> <input type="text" name="recruitment[re_position]" value="{{$detail.re_position}}" style="width:300px;"/></td>
        </tr>
        
        <tr>
            <th>Upload Survey Link:</th>
            <td> <input type="file" name="docs_p" /></td>
        </tr> 
       <tr>
            <th>Upload Document - 2:</th>
            <td> <input type="file" name="docs_2" /></td>
        </tr> 
       
        <tr>
            <th>Upload Document - 3:</th>
            <td> <input type="file" name="docs_3" /></td>
        </tr> 
        
        <tr>
            <th>Upload Survey Results:</th>
            <td> <input type="file" name="survey_result" /></td>
        </tr> 
        
        <tr>
            <th> Star Rating:</th>
            <td> 
                     <style>
					output {
						display: inline-block;
						font-size: 15px;
						font-weight: bold;
						text-align: center;
						width: 300px;
					}
				</style>
                
                <div style="width:100%; margin-top:15px;">
                {{if $re_id  eq 0 }}
                  <input type="range" name = "recruitment[re_rating]" value="0" min="0" max="5" data-rangeSlider>
                {{else}}
    <input type="range" name = "recruitment[re_rating]" value="{{$detail.re_rating}}" min="0" max="5" data-rangeSlider>
	             {{/if}}
                     <output></output>
                </div>
               
         <script>
    	(function () {

        var selector = '[data-rangeSlider]',
                elements = document.querySelectorAll(selector);

        // Example functionality to demonstrate a value feedback
        function valueOutput(element) {
            var value = element.value,
                    output = element.parentNode.getElementsByTagName('output')[0];
            output.innerHTML = value;
        }

        for (var i = elements.length - 1; i >= 0; i--) {
            valueOutput(elements[i]);
        }

        Array.prototype.slice.call(document.querySelectorAll('input[type="range"]')).forEach(function (el) {
            el.addEventListener('input', function (e) {
                valueOutput(e.target);
            }, false);
        });


        // Basic rangeSlider initialization
        rangeSlider.create(elements, {

            // Callback function
            onInit: function () {
            },

            // Callback function
            onSlideStart: function (value, percent, position) {
                console.info('onSlideStart', 'value: ' + value, 'percent: ' + percent, 'position: ' + position);
            },

            // Callback function
            onSlide: function (value, percent, position) {
                console.log('onSlide', 'value: ' + value, 'percent: ' + percent, 'position: ' + position);
            },

            // Callback function
            onSlideEnd: function (value, percent, position) {
                console.warn('onSlideEnd', 'value: ' + value, 'percent: ' + percent, 'position: ' + position);
            }
        });

    })();
</script>
            
            
            </td>
        </tr>
    
    	<tr>
            <th> Notes:</th>
            <td> <textarea name="recruitment[re_notes]" rows="5" cols="100"> {{$detail.re_notes}}</textarea></td>
        </tr>
    	
       	<tr>
            <th> QED:</th>
            <td> Yes <input type="radio" name="recruitment[re_qed]" Value="1" {{if $detail.re_qed eq 1}} checked="checked" {{/if}} > &nbsp; &nbsp; 
                 No  <input type="radio" name="recruitment[re_qed]" Value="0" {{if $detail.re_qed eq 0}} checked="checked" {{/if}} ></td>
        </tr>
        
        <tr><th colspan="2"><div id="doc_list" style="height:auto; padding-bottom:10px; min-height:40px;"></div></th></tr>
        <tr>    <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
                </td>
            </tr>
           
            
		</table>
      </form>
      
      
      
      
     {{else}}
     	<div style="font-size:24px; height:99px; padding-top:150px;">{{$opr}}</div> 
{{/if}}
</div>
   {{if !$opr}}
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("recruitment[re_name]","req", "Please specify name.");
</script>
{{/if}}
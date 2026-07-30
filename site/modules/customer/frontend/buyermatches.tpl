<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/tree/simpletreemenu.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tree/simpletree.css" />

  <script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
  <script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>

  <link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

<style>
		.black_overlay{
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

<div>
  <script>
/*Ajex Url*/
		 var getcurrenturl = "{{$BASE_URL}}{{$XFA.common}}?a_req=";
/*Ajex Url*/


<!--Ajax Common function-->
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
					return false;
					}
            }
          }
        }
		
	function setcurdate(a,b,c)
		{
			var sId = b;
			getcurrenturl2 = getcurrenturl + escape(a) + "&b=" + escape(b) + "&t_id=" + escape(c) + "&random=" + Math.random(); 
			http.open('get',getcurrenturl2,true);
			http.onreadystatechange = handleHttpResponsesetcurdate;
			http.send(null);
			parent.showTop();
			return false;
		}
<!--Ajax Common function-->

		
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
  <table cellpadding="0" cellspacing="0" id="emp-table" width="100%" align="left">
    <tr>
      <td ><table cellpadding="0" cellspacing="0" border="0">
      	<tr><td colspan="3">&nbsp;</td></tr>
      <form name="buyer_matches" action="" method="post" >
      <input type="hidden" name="{{$TABLE}}[bm_cust_id]" value="{{$cust_id}}" />
      <input type="hidden" name="{{$TABLE}}[bm_id]" value="{{$detail.bm_id}}" />
          <tr>
            <th>Created Date: </th>
            <td><input type="text" name="{{$TABLE}}[bm_create_date]" value="{{$detail.bm_create_date}}" class="w16em dateformat-d-ds-m-ds-Y" id="demo41" readonly="readonly"/>
              <input type="text" name="{{$TABLE}}[bm_create_time]" value="{{$detail.bm_create_time}}" class="vvsml" id="t_id11" style="width:50px;" readonly="readonly"/>
              &nbsp;<a href="javascript:setcurdate('curdate','demo41','t_id11');" title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="system time" /></a></td>
            <!--  <td><input type="text" name="temp_date" ></td>
            <td><input type="text" name="temp_date" size="5" ></td> -->
            <td style="width:20px;">&nbsp;</td>
            <td>On Web:</td>
            <td><input type="checkbox" checked="checked" value="1" name="{{$TABLE}}[bm_onweb]" {{if $detail.bm_onweb == 1}} checked="checked" {{/if}} ></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td><table cellpadding="0" cellspacing="0" border="0">
          <tr>
            <th>Description:</th>
            <td><input type="text" name="{{$TABLE}}[bm_description]" class="vvlrg" style="width:700px;" value="{{$detail.bm_description}}" ></td>
          </tr>
          <tr>
            <th>Notes:</th>
            <td><textarea rows="10" cols="132" name="{{$TABLE}}[bm_note]">{{$detail.bm_note}}</textarea></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td><table cellpadding="0" cellspacing="0" border="0">
          <tr>
            <th>Price From:</th>
            <td><input type="text" name="{{$TABLE}}[bm_from_price]" style="text-align:right;" value="{{$detail.bm_from_price}}"></td>
            <td style="width:80px;">&nbsp;</td>
            <td style="font-weight:bold;">Price To:</td>
            <td><input type="text" name="{{$TABLE}}[bm_to_price]" style="text-align:right;" value="{{$detail.bm_to_price}}" ></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td><br>
        <br>
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
          <td width="57%" valign="top"><div class="scroll_div">
                <ul id="treemenu1" class="treeview">
                  {{foreach from=$interest item="item" key="key"}}
                  <li>{{$item.bi_title}}
                    <ul>
                      {{foreach from=$sub_interest item=item1 key=key1}}
                      {{if $item.bi_id == $item1.bi_parent}}
                      <li>
                        <input type="checkbox" name="{{$TABLE}}[abc][]"  value="{{$item1.bi_id}}" />
                        {{$item1.bi_title}}</li>
                      {{/if}}   
                      {{/foreach}}
                    </ul>
                  </li>
                  {{/foreach}}
                </ul>
 <script type="text/javascript">
	ddtreemenu.createTree("treemenu1", true)
</script>
              </div></td>
            <td width="6%">&nbsp;</td>
            <th width="10%" align="right" valign="top">States:</th>
            <td width="27%" align="left" valign="top"> {{foreach from=$main_states item=item key=key}}
              <input type="checkbox" name="{{$TABLE}}[states][]" value="{{$item.s_id}}" />
              {{$item.s_shortcodes}}<br />
              {{/foreach}} </td>
        </table></td>
    </tr>
    <tr>
   		 <td height="50">
         <input type="submit" value="Add" name="Addbuyermatches"  />
         </td>
    </tr>
    </form>
  </table>
</div>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("buyer_matches");
		frmvalidator.EnableMsgsTogether();
		 frmvalidator.addValidation("{{$TABLE}}[bm_description]","req", "Please specify Description.");
		  frmvalidator.addValidation("{{$TABLE}}[bm_from_price]","num", "Please enter numeric value.");
		   frmvalidator.addValidation("{{$TABLE}}[bm_to_price]","num", "Please enter numeric value.");
</script>

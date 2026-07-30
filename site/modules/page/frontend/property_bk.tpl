<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv4.js"></script>
<link rel="stylesheet" href="{{$BASE_URL}}css/default/bottom.css">
<!--<script type="text/javascript" src="{{$BASE_URL}}/js/jquery_slider.js"></script>
--><script type="text/javascript" src="{{$BASE_URL}}/js/jquery.pikachoose.js"></script>
		<script language="javascript">
			$(document).ready(
				function (){
					$("#pikame").PikaChoose({carousel:true});
				});
		</script>
<div class="page_spinner"></div>
<div class="extra">
   <div align="center"> 
  	  <article id="content1" style="background-color:#d1d1d1;">
        {{include file=$mainmenu}}
         <div class="page_content" >
		 	  <div class="wrapper contentPad" >
					<div class="col12"> 
                      	{{if count($prop_images) > 1 }}
                                 <div class="pikachoose" style="border:0px solid #FF0000; width:100%; float:left; top:0;">
                                      <ul id="pikame" class="jcarousel-skin-pika" style="padding-top:0px;">
                                                {{foreach from=$prop_images key="key" item="item"}}
                                                 <li style="padding-top:0px;">
                                                     <a href="#"><img src="{{$BASE_URL}}upload/{{$item.adv_image_name}}" width="420" height="342" > </a>
                                                 </li>
                                               {{/foreach}}
                                        </ul>
								 </div>
                         {{else}}<div class="pikachoose">
                                              <ul style="padding-top:0px;" class="jcarousel-skin-pika">
                                                           {{foreach from=$prop_images key="key" item="item"}}
                                                			<li style="padding-top:0px;">
                                                                 <a href="#"><img src="{{$BASE_URL}}upload/{{$item.adv_image_name}}" width="420" height="342" > </a>
                                                                 {{assign var="thumb" value=$item.adv_image_name}}
															</li>
                                                           {{/foreach}}
                                             </ul>
                                             <br />
                                             <img src="{{$BASE_URL}}upload/thumb/thumb_{{$thumb}}" width="100" height="60" style="padding-top:25px;"/>
                                             <br />
                                             </div>
                        {{/if}}   
                        </div>
                                           <div class="col13">{{$ad_data.adv_listing_detail}}</div>
                                        </div>
           <div class="left10">
               <div class="colL"><h3 >Business Summary</h3> 
               <table cellpadding="0" cellspacing="0" class="bus_summary">
               <tr><th>Industry </th> <td> {{$adv_ind_names}} </td> </tr>
               <tr><th>Location: </th><td>{{$ad_data.adv_suburb}},&nbsp;{{$ad_data.s_name}}</td></tr>
               <tr><th>Business Type: </th><td>{{if $ad_data.adv_business_type eq 1}}Estiblished {{elseif $ad_data.adv_business_type eq 2}} Non Franchise {{elseif $ad_data.adv_business_type eq 3}} Freehold{{/if}}</td></tr>
               <tr><th>Property Information: </th> <td> {{$ad_data.adv_property_info}} </td> </tr>
               <tr><th>Business Workforce:</th> <td> {{$ad_data.adv_business_workforce}} </td> </tr>
               <tr><th>Trading Hours:</th> <td> {{$ad_data.adv_trading_hours}} </td> </tr>
               <tr><th>Business Operation Model:</th> <td> {{$ad_data.adv_business_oprmodel}} </td> </tr>
               </tr>
               </table>
               </div>               
               <div class="colR"><h3>Sales Summary</h3> 
               <table cellpadding="0" cellspacing="0" class="bus_summary">
               <tr><th>Sale Status: </th> <td> {{if $ad_data.adv_sale_status eq 1}} In Preparation{{else}}For Sale{{/if}}</td> </tr>
               <tr><th>Sale Method: </th> <td> {{$ad_data.adv_sale_method}}</td> </tr>
               <tr><th>Investment Amount: </th> <td>{{$ad_data.adv_iaa}} </td></tr>
               <tr><th>Finance Options: </th> <td><div style="border:1px solid #999999; width:97%; height:100px;">{{$ad_data.adv_financial_options}}</div> </td></tr>
               <tr> <th colspan="2">Sale Agent</th></tr>
               <tr> <th rowspan="5"><img src="{{$BASE_URL}}upload/{{$agent_data.sa_image|default:'default.jpg'}}" height="100" class="agent_image" /> </th> <td> {{$agent_data.sa_name}}</td></tr>
               <tr> <td> T : {{$agent_data.sa_phone}} </td> </tr>		
               <tr> <td> M : {{$agent_data.sa_mobile}} </td> </tr>
               <tr> <td> E : {{$agent_data.sa_email}} </td> </tr> 
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
	<script type="text/javascript">
		$(document).ready(function() {
			$(".various1").fancybox({
				'titlePosition'		: 'inside',
				'transitionIn'		: 'false',
				'transitionOut'		: 'false'
			});
				
			$(".various2").fancybox({
				'width'				: '45%',
				'height'			: '50%',
				'transitionIn'		: 'elastic',
				'transitionOut'		: 'elastic',
				'scrolling'		: 'no',
				'hideOnOverlayClick'		: 'no',
				'type'				: 'iframe'
			});	
				
			$(".various3").fancybox({
				'width'				: '75%',
				'height'			: '75%',
				'autoScale'			: false,
				'transitionIn'		: 'false',
				'transitionOut'		: 'false',
				'type'				: 'iframe',
				'onClosed': function() {
   				 parent.location.reload(true);
  				}
			});
		});		
	</script>
               <tr> <td> <a class="various2" href="{{$BASE_URL}}page.profile/sa_id/{{$agent_data.sa_id}}"> View Agent Profile </a> </td> </tr> 
               </table>
               </div>
           </div>  
           <div class="colfull"><h3>Financial Snapshot</h3>
           <table border="0" cellpadding="0" cellspacing="0" class="fs_table">
           <tr> <th>Reporting Period</th><th>Financial Year </th> <th>Weekly Average</th><th>Financial Year</th><th>Weekly Average</th> </tr>
           {{foreach from=$fin_snapshot key="key" item="item"}}
           <tr> <td> {{$item.f_reporting_period}}</td><td>{{$item.f_financial_year1}} </td> <td>{{$item.f_weekly_average1}}</td><td>{{$item.f_financial_year2}}</td><td>{{$item.f_weekly_average2}}</td> </tr>
           {{/foreach}}
           </table>
           </div>
           <div class="colL1"> testing...</div>
           <div class="colR1"><h3>Enquire Now and Receive a Full Business Dossier </h3>
           <form name="Enquire" action=""  method="post">
                 	<table cellpadding="0" cellspacing="0" width="333" id="form-table">
                   	<tr><th>&nbsp; </th>
                          <td>{{if $add_buyer_enque}}<div style="width:150px; float:right;">Thank you for your enquiry. We will be in touch shortly.</div>  {{/if}}  </td>
                     </tr>
                     </table>    
<input type="text" class="inputboxmed" name="{{$TABLE}}[be_fname]" value="Your First Name" onBlur="if(this.value=='') this.value='Your First Name'" onFocus="if(this.value =='Your First Name' ) this.value=''"/> <br />

<input type="text" class="inputboxmed" name="{{$TABLE}}[be_lname]" value="Your Last Name" onBlur="if(this.value=='') this.value='Your Last Name'" onFocus="if(this.value =='Your Last Name' ) this.value=''"/> <br />

<input type="text" class="inputboxmed" name="{{$TABLE}}[be_email]" value="Your Email" onBlur="if(this.value=='') this.value='Your Email'" onFocus="if(this.value =='Your Email' ) this.value=''"/>
<br />

<input type="text" class="inputboxmed" name="{{$TABLE}}[be_phone]" value="Your Phone" onBlur="if(this.value=='') this.value='Your Phone'" onFocus="if(this.value =='Your Phone' ) this.value=''"/>
<br />
<textarea rows="10" cols="30" class="tarea1" name="{{$TABLE}}[be_body]" onBlur="if(this.value=='') this.value='Your Message'" onFocus="if(this.value =='Your Message' ) this.value=''">Your Message: Regarding Listing - {{$ad_data.adv_title|stripcslashes}}</textarea>

<table border="0" width="98%">
<tr> <td style="padding-left:15px"> <img src="{{$BASE_URL}}site.captcha" style="padding-bottom:8px;" height="30"   />  </td>
<td>
<input type="text" style="font-size:11px; padding-left:10px; font-family:Verdana, Arial, Helvetica, sans-serif; height:25px;" name="security_code" value="Enter Security Code" onBlur="if(this.value=='') this.value='Enter Security Code'" onFocus="if(this.value =='Enter Security Code' ) this.value=''"/> 
</td>
</tr>
</table>
<div align="center" style="padding-bottom:8px;"> <input type="submit" value="Enquire Now" name="subAddDetail" class="button"/></div>
        </form>   
             </div>
          </div>  
    	</article>
   	</div>
</div>
 <script type="text/javascript" language="javascript">
     var frmvalidator  = new Validator("Enquire");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("{{$TABLE}}[be_fname]","req", "Please specify first name.");
		frmvalidator.addValidation("{{$TABLE}}[be_lname]","req", "Please specify last name");
		frmvalidator.addValidation("{{$TABLE}}[be_email]","req", "Please specify email.");
		frmvalidator.addValidation("{{$TABLE}}[be_email]","email", "Please specify valid email.");
		frmvalidator.addValidation("{{$TABLE}}[be_phone]","req", "Please specify phone number.");
		frmvalidator.addValidation("{{$TABLE}}[be_body]","req", "Please specify message.");					   
</script>
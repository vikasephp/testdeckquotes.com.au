<style>
.bullet ul li {list-style:disc!important; margin-left:3px; }
</style>

 <script type="text/javascript">
	/*<![CDATA[*/
		function doAlert(parent)
		{
			var msg = new DOMAlert(
			{
				title: 'http://www.capitalcommercial.com.au/',
				text: '<h2>Thank You For Contacting Us</h2>',
				skin: 'default',
				width: 300,
				//ok: {value: true, text: '', onclick: showValue},
				cancel: {value: true, text: '', onclick: showValue }
			});
			msg.show();
		};
		
		function showValue(sender, value)
		{
			sender.close();
			//var newMsg = new DOMAlert({skin: 'default', width: 200});
			//newMsg.show("Your response", "You pressed " + value);
		}
		
		
	/*]]>*/
	</script>


<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv4.js"></script>
     <script type="text/javascript" src="{{$BASE_URL}}/js/jquery.pikachoose.js"></script>
		<script language="javascript">
			$(document).ready(
				function (){
					$("#pikame").PikaChoose({carousel:true});
				});
		</script>   
          {{include file=$mainmenu_d}} 
 
 <div class="container main-box">
  <h5 style="padding-left:5px;">{{$ad_data.adv_title}}</h5>
  <div class="col-md-7 col-sm-6 col-xs-12">
    <div class="hw">
      <div class="row">
        <div class="featurette" id="about"> 
      <!------------------------code---------------start---------------->
      
      
      
      <div class="container-fluid">
    {{if $ad_data.adv_sale_status eq 3}}
           <img src="{{$BASE_URL}}images/underoffer_big.png" style="position:absolute; width:100px; height:100px; z-index:999; float:left;"/>
    {{elseif $ad_data.adv_sale_status eq 4}}             
           <img src="{{$BASE_URL}}images/sold.png" style="position:absolute; width:100px; height:100px; z-index:999; float:left;"/>
    {{elseif $ad_data.adv_sale_status eq 5}}             
           <img src="{{$BASE_URL}}images/eoi.png" style="position:absolute; width:100px; height:100px; z-index:999; float:left;"/>
    {{elseif $ad_data.adv_sale_status eq 6}}             
           <img src="{{$BASE_URL}}images/new_listing.png" style="position:absolute; width:100px; height:100px; z-index:999; float:left;"/>
    {{elseif $ad_data.adv_sale_status eq 7}}             
           <img src="{{$BASE_URL}}images/new_price.png" style="position:absolute; width:100px; height:100px; z-index:999; float:left;"/>              
    {{elseif $ad_data.adv_sale_status eq 8}}             
           <img src="{{$BASE_URL}}images/under_contract.png" style="position:absolute; width:100px; height:100px; z-index:999; float:left;"/>
    {{elseif $ad_data.adv_sale_status eq 9}}             
           <img src="{{$BASE_URL}}images/fit-out_value.png" style="position:absolute; width:100px; height:100px; z-index:999; float:left;"/>
    {{elseif $ad_data.adv_sale_status eq 10}}             
           <img src="{{$BASE_URL}}images/seller_finance_25.png" style="position:absolute; width:100px; height:100px; z-index:999; float:left;"/> 
    {{elseif $ad_data.adv_sale_status eq 11}}             
           <img src="{{$BASE_URL}}images/seller_finance_50.png" style="position:absolute; width:100px; height:100px; z-index:999; float:left;"/> 
    {{elseif $ad_data.adv_sale_status eq 12}}             
           <img src="{{$BASE_URL}}images/seller_finance_100.png" style="position:absolute; width:100px; height:100px; z-index:999; float:left;"/> 
        
    {{/if}}
     {{if $ad_data.adv_seller_finance eq 1}}
            <img src="{{$BASE_URL}}images/seller_finance_25_right.png" class="sfo" />
     {{elseif $ad_data.adv_seller_finance eq 2}}  
            <img src="{{$BASE_URL}}images/seller_finance_50_right.png" class="sfo" />
     {{elseif $ad_data.adv_seller_finance eq 3}}  
             <img src="{{$BASE_URL}}images/seller_finance_100_right.png" class="sfo" />
     {{elseif $ad_data.adv_seller_finance eq 4}}  
             <img src="{{$BASE_URL}}images/sav_seller_finance_right.png" class="sfo" />        
     {{/if}}
 
 
        <div id="custom_carousel" class="carousel slide" data-ride="carousel" data-interval="2500"> 
          <!-- Wrapper for slides -->
             <div class="carousel-inner">
          
       
                    <ul id="pikame" class="jcarousel-skin-pika" style="padding-top:0px;">
                    			
                            {{foreach from=$prop_images key="key" item="item"}}
                             <li style="padding-top:3px;">
                               <a href="#">
                                
                               <img src="{{$BASE_URL}}upload/{{$item.adv_image_name}}" width="460" height="480" > </a>
                             </li>
                            {{/foreach}}
                    </ul>
             </div>
         </div>
        
        <!-- End Carousel --> 
      </div>
      <!----Code------end-----------------------------------> 
        </div>
      </div>
    </div>
  <!---T------>
    <div class="summery-col">
                <h3>Business Details</h3>
                <div class="binglangtext">
                {{$ad_data.adv_listing_detail}}
                </div>
        </div>
      <div class="clearfix"></div>
    <div class="summery-col marg-20">
      <h3>Financial Snapshot </h3>
      <div class="table-container">
        <table class="table-responsive" >
          <tbody>
            <tr>
              <th>Reporting Period</th>
              <th>{{$detail_head.fh_finyear1}}</th>
              <th>Weekly Average</th>
              <th>{{$detail_head.fh_finyear2}}</th>
              <th>Weekly Average</th>
              <th>{{$detail_head.fh_finyear3}}</th>
              <th>Weekly Average</th>
            </tr>
            
            {{foreach from=$fin_snapshot key="key" item="item"}}
           <tr> <td style="border:1px solid #666;"> {{$item.f_reporting_period}}</td>
           <td style="border:1px solid #666;" >
           
              {{if $item.f_financial_year1 > 0}}
	           ${{$item.f_financial_year1|number_format:2:".":","}}
           {{else}}
    		   {{$item.f_financial_year1}}  
           {{/if}}
           
           
             </td>
           
           
           <td style="border:1px solid #666;">${{$item.f_financial_year1/52|number_format:2:".":","}}</td>
           <td style="border:1px solid #666;">${{$item.f_financial_year2|number_format:2:".":","}}</td><td style="border:1px solid #666;">${{$item.f_financial_year2/52|number_format:2:".":","}}</td>
           <td style="border:1px solid #666;">${{$item.f_financial_year3|number_format:2:".":","}}</td>
           
           <td style="border:1px solid #666;">${{$item.f_financial_year3/52|number_format:2:".":","}}</td>
            </tr>
           {{/foreach}}
            

          </tbody>
        </table>
        
       
      </div>
     
    </div>
  <!---end----->
  
  <p class="clear"><p>
<div style="text-align:center">{{$ad_data.adv_video}}</div>
  
  </div>
    
  
  <div class="col-md-5 col-sm-6 col-xs-12">
    <div class="summery-col">
      <h3>Business Summary</h3>
      <article>
        <div class="ico-left"><img src="{{$BASE_URL}}images/gtr-2.png"></div>
        <div class="ico-sum binglangtext">{{$ad_data.adv_suburb}},&nbsp;{{$ad_data.s_name}}</div>
        <div class="clearfix"></div>
      </article>
      <article>
        <div class="ico-left"><img src="{{$BASE_URL}}images/gtr-3.png"></div>
        <div class="ico-sum binglangtext">{{$adv_ind_names}}</div>
        <div class="clearfix"></div>
      </article>
      <article>
        <div class="ico-left"><img src="{{$BASE_URL}}images/gtr-5.png"></div>
        <div class="ico-sum binglangtext bullet">{{$ad_data.adv_property_info}}</div>
        <div class="clearfix"></div>
      </article>
      <article>
        <div class="ico-left"><img src="{{$BASE_URL}}images/gtr-8.png"></div>
        <div class="ico-sum binglangtext">{{$ad_data.adv_business_workforce}}</div>
        <div class="clearfix"></div>
      </article>
      <article>
        <div class="ico-left"><img src="{{$BASE_URL}}images/gtr-6.png"></div>
        <div class="ico-sum binglangtext">{{$ad_data.adv_trading_hours}}</div>
        <div class="clearfix"></div>
      </article>
      <article>
        <div class="ico-left"><img src="{{$BASE_URL}}images/gtr-7.png"></div>
        <div class="ico-sum binglangtext">{{$ad_data.adv_business_oprmodel}}</div>
        <div class="clearfix"></div>
      </article>
    </div>
    
       <article class="enquiry quote">
      <h3>Enquire Now</h3>
      <form name="Enquire" action=""  method="post" onsubmit="doAlert();">
      <div class="form-group">
        <input name="{{$TABLE}}[be_fname]" id="name" value="{{$detail.be_fname}}" class="form-control" placeholder="Full Name" onBlur="if(this.placeholder=='') this.placeholder='Full Name'" onFocus="if(this.placeholder =='Full Name' ) this.placeholder=''" tabindex="1" type="text" required="required">
      </div>
      <div class="form-group">
        <input name="{{$TABLE}}[be_phone]" id ="phone1" value="{{$detail.be_phone}}" class="form-control" placeholder="Phone No" onBlur="if(this.placeholder=='') this.placeholder='Phone No'" onFocus="if(this.placeholder =='Phone No' ) this.placeholder=''"  tabindex="1" type="text" required="required">
      </div>
      <div class="form-group">
        <input name="{{$TABLE}}[be_email]" id="email" value="{{$detail.be_email}}" class="form-control" placeholder="Email" onBlur="if(this.placeholder=='') this.placeholder='Email'" onFocus="if(this.placeholder =='Email' ) this.placeholder=''" tabindex="1" type="email" required="required">
      </div>

      <div class="form-group">
        <input name="{{$TABLE}}[be_body]" id="comment" class="form-control " placeholder="Comments" onBlur="if(this.placeholder=='') this.placeholder='Comments'" onFocus="if(this.placeholder =='Comments' ) this.placeholder=''" tabindex="1" type="text">
      </div>
      <div class="form-group">
        <!--<button class="btn">Enquiry Now</button> -->
       
        <input type="submit" name="subAddDetail" value="Enquire Now" class="btn enqnow" />

      </div>
      </form>
      <div class="clearfix"></div>
    </article>
    
    <article class="sales-body">
      <h3>Sales Summary</h3>
      <p><sub>Sale Status </sub>: <em> {{if $ad_data.adv_sale_status eq 1}} In Preparation{{elseif $ad_data.adv_sale_status eq 2}}For Sale{{elseif $ad_data.adv_sale_status eq 3}}Under Offer{{elseif $ad_data.adv_sale_status eq 4}}Sold {{elseif $ad_data.adv_sale_status eq 5}}EOI {{elseif $ad_data.adv_sale_status eq 6}}New Listing 
{{elseif $ad_data.adv_sale_status eq 7}}New Price  {{elseif $ad_data.adv_sale_status eq 8}}Under Contract 
{{elseif $ad_data.adv_sale_status eq 9}}Fit Out Value  {{/if}}</em> </p>
      <p><sub>Sale Method </sub>: {{$ad_data.adv_sale_method}}</p>
      <p><sub>Investment Amount </sub>: {{$ad_data.adv_iaa}} </p>
      <p><sub>Stock at Value </sub>: ${{$ad_data.adv_stock_value|number_format:2:".":","}} </p>
      <p><sub>Finance Options </sub>: {{if $ad_data.adv_seller_finance eq 1}} <em> Seller Finance Offered 25% </em> 
                                      {{elseif $ad_data.adv_seller_finance eq 2}} <em> Seller Finance Offered 50% </em> 
                                      {{elseif $ad_data.adv_seller_finance eq 3}} <em> Seller Finance Offered 100% </em> 
                                      {{elseif $ad_data.adv_seller_finance eq 4}} <em> SAV Seller Financed</em> 
                                      {{/if}}  
      <br /><br />
      
      <img src="{{$BASE_URL}}images/sl-pro.png" class="img-responsive">
      <h6>{{$agent_data.sa_name}}</h6>
   <!--   <p><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> {{$agent_data.sa_phone}}</p>-->
      <p><span class="glyphicon glyphicon-phone" aria-hidden="true"></span>{{$agent_data.sa_mobile}}</p>
      <p><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
      
      <a href = "mailto:{{$agent_data.sa_email}}?subject={{$ad_data.adv_title}}">{{$agent_data.sa_email}}</a></p>
    </article>
   
    
  </div>
  <div class="clearfix"></div>
  <div class="col-md-7 col-sm-9 col-xs-12 marg-20">


    <div class="clearfix"></div>
  </div>
  
</div>
 
        
<p class="clear"></p>
<div class="mainWraper">

<!-- mid section:start -->
<div class="insidecontainer">
<div class="coulmn">

	
</div>
<script type="text/javascript">
$(document).ready(function() {
    $("#phone1").keydown(function (e) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
             // Allow: Ctrl+A, Command+A
            (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
             // Allow: home, end, left, right, down, up
            (e.keyCode >= 35 && e.keyCode <= 40)) {
                 // let it happen, don't do anything
                 return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    });
});
</script>


</div>


</div>
<!-- mid section:end -->    

<script type="text/javascript">
 $('input,textarea').focus(function(){
       $(this).removeAttr('placeholder');
    });
</script> 
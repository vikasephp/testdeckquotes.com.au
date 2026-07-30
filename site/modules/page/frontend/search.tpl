
<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv4.js"></script>

<script type="text/javascript" src="{{$BASE_URL}}js/tree/simpletreemenu.js"></script>

 <link rel="stylesheet" href="{{$BASE_URL}}css/default/reset.css" type="text/css" media="all">
  <link rel="stylesheet" href="{{$BASE_URL}}css/default/grid.css" type="text/css" media="all">
  <link rel="stylesheet" href="{{$BASE_URL}}css/default/style.css" type="text/css" media="all">
  <script type="text/javascript" src="{{$BASE_URL}}js/maxheight.js"></script>
  <script type="text/javascript" src="{{$BASE_URL}}js/jquery-1.4.2.min.js" ></script>
  <script type="text/javascript" src="{{$BASE_URL}}js/cufon-yui.js"></script>
<!--  <script type="text/javascript" src="{{$BASE_URL}}js/cufon-replace.js"></script>-->
<!--  <script type="text/javascript" src="{{$BASE_URL}}js/OliJo_700.font.js"></script>-->

 <!--[if lt IE 7]><script type="text/javascript" src="http://info.template-help.com/files/ie6_warning/ie6_script_other.js"></script><![endif]-->
  <!--[if lt IE 9]><script type="text/javascript" src="{{$BASE_URL}}js/html5.js"></script><![endif]-->

  <script type="text/javascript" src="{{$BASE_URL}}js/jquery.jqtransform.js" ></script>
<script type="text/javascript">
	$(function(){
		$('#search-form').jqTransform({imgPath:'jqtransformplugin/img/'});
	});
</script>

<script type="text/javascript">
	function DoCustomValidation()
			{
			 var frm = document.forms["search_prop"];

					if (frm.from_price.value == 1 && frm.to_price.value == 4000000)
						{
						sfm_show_error_msg('Please select valid price range.',frm.from_price);
						return false;
						}
						else
						  {
							return true;
						  }		
		}
		
	function check_child(pid)	
			{
			var chkul = 'bl_'+pid;
			var chkli = 'li_'+pid;	
			
			
			
			if(document.getElementById(chkul).checked == 1){
			 document.getElementById(pid).style.display='block';
			 
			
					for(i=0; i<100;i++ )
					{
					var chid = chkli+[i];
						document.getElementById(chid).checked = true;	
					}		

				}else
				{
				 document.getElementById(pid).style.display='none';	
				 	for(i=0; i<100;i++ )
					{
					var chid = chkli+[i];
						document.getElementById(chid).checked = false;	
					}
				}
		
			}
</script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tree/simpletree.css" />



<body onLoad="new ElementMaxHeight();">
<section id="content">
   <div class="bg_cont1">
       <div class="bg_cont">
           <div class="main container_24">
                <div class="inside1">
                    <div class="container">
                        <div class="grid_7 maxheight alpha">
                            <div class="box maxheight">
                                <div class="indent-box1">
                                    <div class="box1">
                                        <div class="indent-box">
                                            <h2>About Buying</h2>
                                            <img alt="" src="images/3page_img1.jpg" class="img-indent" /><br>
                                            <p>Fusce suscipit varius mi. Cum sociis noque penatibus et magnis dis parturient montes, nascetur ridics mus. Nulla dui. Fusce feat malesuada odio.</p>
                                            <p>Maecenas tristique orci ac sem. Duis ucies pharetra magna. Donec accumsan malesuada orci. </p>
                                            <div class="container"><a href="#" class="link-3">More Info</a></div>
                                        </div>
                                    </div>
                                    <div class="indent2">
                                    	<div class="box1">
                                            <div class="indent-box">
                                                <h2>Special Offer</h2>
                                                <a href="#" class="link1">Vestibulum ante. Donec sagittis.</a>
                                                <p>Praesent vestibulum molestie lacus. Aenean nonummy hendrerit mauris. Phasellus porta. Fusce suscipit varius mi. Cum sociis.</p>
                                                 <div class="tail container">
                                                    <img alt="" src="images/3page_img2.jpg" class="img-left" />
                                                   Duis ultricies pharetra mana donec accumsan malesuada orci. Donec sit eros. <a href="#" class="link1">Read more</a>
                                                    <br class="clear" />
                                                </div>
                                                <div class="tail container">
                                                    <img alt="" src="images/3page_img3.jpg" class="img-left" />
                                                    Quisque nulla. Duis ultricies pharetra mana donec accumsan male-<br>suada orci. <a href="#" class="link1">Read more</a>
                                                    <br class="clear" />
                                                </div>
                                                <div class="container p1">
                                                    <img alt="" src="images/3page_img4.jpg" class="img-left" />
                                                    Uis ultricies pharetra mana donec accumsan malesuada orci. Donec sit eros. <a href="#" class="link1">Read more</a>
                                                    <br class="clear" />
                                                </div>
                                                <p>Pellentesque sed dolor. Aliquam congue fermentum nisl. Mauris accumsan nulla vel diam. Sed in lacus ut enim adipiscing aliquet. Nulla venenatis. </p>
                                            </div>
                                        </div>   
                               		</div>                                
                                </div>
                            </div>
                        </div>
                        <div class="grid_17 maxheight omega">
                            <div class="box maxheight">
                                <div class="indent-box3">
                                    <div class="box1">
                                        <div class="indent-box">
                                        

                                            
    <table cellpadding="3" cellspacing="5">
    <tr>
         <td width="306" align="left">
               		<h2>Quick Search </h2>
          		<form action="{{$BASE_URL}}page.list" method="post" name="search_prop">
            	       	<select name="location" class="select2">
                    		{{foreach from=$location key="key" item="item"}}
                    				<option value="{{$item.l_id }}" style="padding:5px;">{{$item.l_name}}</option>
                    		{{/foreach}}	
                  		</select>
                        

     <div class="scroll" style="margin-top:10px;">
      	 <div class="divbox" >
           	<ul class="treeviewhome">
      
                {{foreach from=$interest item="item" key="key"}}
                	<li class="submenu" style="padding-top:5px;" ><input type="checkbox" class="checkbox" onClick="check_child('{{$item.bi_id}}');" id="bl_{{$item.bi_id}}">{{$item.bi_title}}
                		<ul id="{{$item.bi_id}}">
                            {{assign var="count" value=0}}         	
                            {{foreach from=$sub_interest item=item1 key=key1}}
                                {{if $item.bi_id == $item1.bi_parent}}
                                <li>
                                     <input type="checkbox" name="abc[]" value="{{$item1.bi_id}}" class="checkbox" id="li_{{$item1.bi_parent}}{{$count}}" {{foreach from=$ind_codes item="item100" key="key100"}} {{if $item100 == $item1.bi_id}}  checked="checked" {{/if}}{{/foreach}}  />
                                    {{$item1.bi_title}}
                                </li>
                                    {{assign var="count" value= $count+1}} 
                                {{/if}}
                			{{/foreach}}
               			 </ul>
                    </li>
                	{{assign var="count" value=0}}  
                {{/foreach}}
            </ul>
			</div>
            </div> 
            	<div style="padding-top:10px;">	
                   <select name="from_price" class="select2">            
                     <option value="1" style="padding:5px;">$ 0</option>
                      {{foreach from=$price_rang_from key="priceoption" item="pricedata" }}
                      <option value="{{$priceoption}}" style="padding:5px;" >$ {{$pricedata|number_format:2}}</option>
                      {{/foreach}}
                      
                    </select>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                  <select name="to_price" class="select2">
                       {{foreach from=$price_rang_to key="priceoption" item="pricedata"}}
                      <option value="{{$priceoption}}" selected="selected" style="padding:5px;">$ {{$pricedata|number_format:2}}</option>
                      {{/foreach}}
                    </select>
                 </div>
                 <div align="center" style="padding-top:15px;"> <input type="submit" name="submit" class="link-22" value="Search" style="width:150px;"/>
      </form>  
    
    </td>
    </tr>
     </table>         
           
<script type="text/javascript">
ddtreemenu.createTree("treemenu1", true);
</script>
      
     
                 
                                           
                                 
                                     <div class="indent">
                                     	<h2>Best Proposals This Week</h2>
                                        <a href="#" class="link1">Vestibulum sed ante. Donec sagittis euismod purus.</a>
                                        <p>Praesent vestibulum molestie lacus. Aenean nonummy hendrerit mauris. Phasellus porta. Fusce suscipit<br>
                                        varius mi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla dui.<br> Fusce feugiat malesuada odio. Morbi nunc odio, gravida at, cursus nec, luctus a, lorem. </p>
                                        <div class="container">
                                        	<img alt="" src="images/3page_img5.jpg" class="img-left1" />
                                            <p class="p3"><a href="#" class="link1">Donec sagittis euismod.</a></p>
                                            <p>Praesent vestibulum molestie lacus. Aenean nonummy hendrerit mauris. Phasellus porta. Fusce suscipit varius mi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla dui. </p>
                                            <span class="txt2">$ 499'000</span> <a href="#" class="link-4">More Info</a>
                                            <br class="clear" />
                                        </div>
                                        <div class="container">
                                        	<img alt="" src="images/3page_img6.jpg" class="img-left1" />
                                            <p class="p3"><a href="#" class="link1">Donec sagittis euismod.</a></p>
                                            <p>Praesent vestibulum molestie lacus. Aenean nonummy hendrerit mauris. Phasellus porta. Fusce suscipit varius mi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla dui. </p>
                                            <span class="txt2">$ 499'000</span> <a href="#" class="link-4">More Info</a>
                                            <br class="clear" />
                                        </div>
                                        <div class="container">
                                        	<img alt="" src="images/3page_img7.jpg" class="img-left1" />
                                            <p class="p3"><a href="#" class="link1">Donec sagittis euismod.</a></p>
                                            <p>Praesent vestibulum molestie lacus. Aenean nonummy hendrerit mauris. Phasellus porta. Fusce suscipit varius mi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla dui. </p>
                                            <span class="txt2">$ 499'000</span> <a href="#" class="link-4">More Info</a>
                                            <br class="clear" />
                                        </div>
                                        <div class="container">
                                        	<img alt="" src="images/3page_img8.jpg" class="img-left1" />
                                            <p class="p3"><a href="#" class="link1">Donec sagittis euismod.</a></p>
                                            <p>Praesent vestibulum molestie lacus. Aenean nonummy hendrerit mauris. Phasellus porta. Fusce suscipit varius mi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla dui. </p>
                                            <span class="txt2">$ 499'000</span> <a href="#" class="link-4">More Info</a>
                                            <br class="clear" />
                                        </div>
                                     </div> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
           </div>
       </div>
   </div>
</section>

    

</body>
</html>

<body>
<div class="page_spinner"></div>
<div class="extra">
	<div align="center" > 

		<article id="content1">
        {{include file=$mainmenu}}
            
            <ul style="height:940px; text-align:left;">
               <li id="page_more_serve" style="height:auto;">
				 <div class="wrapper contentPad" >
					<div class="cols">
						<h2>Who we serve...</h2>
                            
              				<b>Sellers we serve: </b><br><br>
                            If you own a business and are committed to the process of discovering who is the best buyer for your business, 
                            and under what terms and conditions they will buy then we welcome the opportunity to work with and for you. <br>
                            Tell us how we can assist. <br> <br>
                            
                         	<form name="form1" id ="form" method="post" action="">
                            
                            <input type="text" name ="seller[name]" class="inputboxlrg" value="Full Name:" onBlur="if(this.value=='') this.value='Full Name:'" onFocus="if(this.value =='Full Name:' ) this.value=''"> <br>
                            
                            <input type="text" name ="seller[business]" class="inputboxlrg" value="Business (to remain in strict confidence):" onBlur="if(this.value=='') this.value='Business (to remain in strict confidence):'" onFocus="if(this.value =='Business (to remain in strict confidence):' ) this.value=''"> <br>
                            
                            <input type="text" name ="seller[contact]" class="inputboxlrg" value="Best contact number:" onBlur="if(this.value=='') this.value='Best contact number:'" onFocus="if(this.value =='Best contact number:' ) this.value=''"> <br>
                            
                         <input type="text" name ="seller[email]" class="inputboxlrg" value="Best email:" onBlur="if(this.value=='') this.value='Best email:'" onFocus="if(this.value=='Best email:' ) this.value=''"> <br>
                            <textarea  class="tarea" name ="seller[help]" onBlur="if(this.value=='') this.value='Tell us how we can help?:'" onFocus="if(this.value=='Tell us how we can help?:' ) this.value=''">Tell us how we can help?:</textarea>  <br> 
                            	
                            <input type="submit" value="Submit" class="btn" name="seller_submit">	
                                
                            </form>   
                            {{if $msg1}} <div style="color:#063; font-size:15px; padding-top:5px;"> {{$msg1}} </div> {{/if}}
                                           
                           <br><br>
                            <b>Buyers we serve:</b> <br><br>
                            If you're a business buyer searching for your ideal business and you would like to systemise your search then put capital to work.
                            We have developed a system that enables us cost effectively collate business for sale lists across industry, location and price range. <br>
                            Unfortunately as we are exclusive seller agents, it is impermissible for capital to work as buyer agents.  <br> <br>
                             <form name="form2" id ="form" method="post" action="">
                            <input type="text" name ="buyer[name]" class="inputboxlrg" value="Full Name:" onBlur="if(this.value=='') this.value='Full Name:'" onFocus="if(this.value =='Full Name:' ) this.value=''"> <br>
                            <input type="text" name ="buyer[contact]" class="inputboxlrg" value="Best contact number:" onBlur="if(this.value=='') this.value='Best contact number:'" onFocus="if(this.value =='Best contact number:' ) this.value=''"> <br>
                         <input type="text" name ="buyer[email]" class="inputboxlrg" value="Best email:" onBlur="if(this.value=='') this.value='Best email:'" onFocus="if(this.value=='Best email:' ) this.value=''"> <br>
                            <textarea  class="tarea" name ="buyer[help]" onBlur="if(this.value=='') this.value='Tell us how we can help your business buying search?:'" onFocus="if(this.value=='Tell us how we can help your business buying search?:' ) this.value=''">Tell us how we can help your business buying search?:</textarea> <br> 
                            <input type="submit" value="Submit" class="btn">	    
                            </form>
                            {{if $msg2}} <div style="color:#063; font-size:15px; padding-top:5px;"> {{$msg2}} </div> {{/if}}
                            <br>
                            Thank You

						</div>
					</div>
                    
                    <div style="float:right; padding-bottom:15px; padding-right:20px;"> 
                    <input type="button" value="Our Current Listings" class="btn" onClick="document.location.href='{{$BASE_URL}}current-listings.htm'"> </div>
                    
				</li>
         </ul>
            
	 	</article>
   
	</div>
</div>
<script>
$(window).load(function() {	
	$('.page_spinner').fadeOut(200);
	$('body').css({overflow:'visible'})
})
</script>
</body>
</html>
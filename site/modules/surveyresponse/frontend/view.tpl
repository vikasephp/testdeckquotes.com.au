<script type="text/javascript" src="{{$BASE_URL}}js/animatedcollapse.js"></script>

<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>

<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>

<link rel="stylesheet" href="{{$BASE_URL}}css/default/style.css" type="text/css" media="all">


 {{include file=$banner}}

         </header>



<div class="main-box">

                      <div class="left-top-corner">
                
                         <div class="right-top-corner">
                
                            <div class="border-top"></div>
                
                         </div>
                
                      </div>

      <div class="border-left">

         <div class="border-right">

            <div class="xcontent">

               <div class="tail">

                  <div class="inner">

                     <div class="wrapper">

                        <!-- aside -->

                        <aside>

                           {{include file=$leftsidebar}}

                        </aside>         

     <section id="content">


      <div align="center" style="padding-top:20px;">

    <table>
	<tr height="40"> <td align="right" style=" padding-left:480px;"> <a href="javascript:window.history.back();" class="link2"> BACK </a> </td> </tr>
    </table>
    <table border="0"  cellpadding="5" class ="view-table">
    <tr> <td align="left">  <h2> Questions </h2> </td> <td align="left"> <h2> Answers </h2> </td> </tr>
    <tr> <td colspan="2"> <hr width="100%" size="2" />
    {{foreach from=$show_Data key="key" item="item" }}
	{{if $item.res_column_value }}
		<tr height="40" > <td height="40" align="left"> {{$item.res_column_name}} </td> <td style="color:#333333;" align="left"> {{if $item.res_column_name=='StartDate' || $item.res_column_name=='EndDate' }} {{$item.res_column_value|date_format:"%e %B, %Y"}}  {{else}} {{$item.res_column_value}} {{/if}}</td> 
    {{/if}}    
{{/foreach}}
<tr> <td> &nbsp; </td> </tr>
</table>
  



      </div>

                </section>

                     </div>

                  </div>

               </div>

            </div>

         </div>

      </div>

   </div>
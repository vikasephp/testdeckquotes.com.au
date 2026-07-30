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

    
                        
                            <table cellpadding="0" cellspacing="0" width="100%" class="table-data2" >
                            <tr> <td colspan="2"> <h2 align="center"> Survey Response List </h2> </td> </tr>
                            <tr> <td width="80%" align="left" style="font-size:16px; font-weight:bold;"> Response Id </td>  <td style="font-size:16px;font-weight:bold;">Action </td></tr>
                              {{foreach from=$surveyData key="key" item="item" }}
                              <tr>
                              <td align="left"> {{$item.res_respondent_id}}</td>
                              <td> <a href = "{{$BASE_URL}}surveyresponse.view/id/{{$item.res_respondent_id}}">

                               <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/view.png" border="0" title="View"/></a> </td>  
                              </tr>
                              {{/foreach}}
                            
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
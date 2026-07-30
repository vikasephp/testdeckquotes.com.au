<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  

{{if $opr}}

<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<style>
/* The container */
.container {
    display: inline-block;
    position: relative;
    padding-left: 35px;
    margin-bottom: 12px;
    cursor: pointer;
    font-size: 16px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
	
}

/* Hide the browser's default radio button */
.container input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
}

/* Create a custom radio button */
.checkmark {
    position: absolute;
    top: 0;
    left: 0;
    height: 25px;
    width: 25px;
    background-color: #eee;
    border-radius: 50%;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
    background-color: #ccc;
}

/* When the radio button is checked, add a blue background */
.container input:checked ~ .checkmark {
    background-color: #2196F3;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
    content: "";
    position: absolute;
    display: none;
}

/* Show the indicator (dot/circle) when checked */
.container input:checked ~ .checkmark:after {
    display: block;
}

/* Style the indicator (dot/circle) */
.container .checkmark:after {
 	top: 9px;
	left: 9px;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background: white;
}
</style>


<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    
    {{if $opr}}
	<div align="center" style="min-height:350px; padding-top:200"><h3>Success...!</h3></div>
    {{else}}
      <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
        <table id="list-table" width="50%" cellpadding="3">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
           {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
           <tr> <th> Image </th> <th> Click to select Image </th> </tr>
			{{foreach from=$imagedata key="key" item="item"}}
            <tr>
                <th width="300"><img src="{{$BASE_URL}}files/galleries/{{$item.file}}" height="60" /></th>
                <td style="text-align:center;"><!--<input type = "radio" name="{{$TABLE}}[id][]" value="{{$item.ig_id}}" {{if $item.ig_id eq $sf_link_uid}} checked="checked" {{/if}} />-->
                
                <label class="container">
                 <input type = "radio" name="{{$TABLE}}[id][]" value="{{$item.ig_id}}" {{if $item.ig_id eq $sf_link_uid}} checked="checked" {{/if}} />
                  <span class="checkmark"></span>
                </label>
                                </td>
            </tr>
 			{{/foreach}}
		 <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
                </td>
            </tr>
            

        </table>
    </form>
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			
			frmvalidator.addValidation("{{$TABLE}}[sf_title]","req", "Please specify title.");
			frmvalidator.addValidation("{{$TABLE}}[sf_component]","req", "Please specify component.");
			frmvalidator.addValidation("{{$TABLE}}[sf_body]","req", "Please specify formula.");
    </script>
   {{/if}} 
</div>

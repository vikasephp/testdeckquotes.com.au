<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<!--<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />-->
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

	<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>

	<script type="text/javascript">
           CKEDITOR.replace( 'editor1' );
           CKEDITOR.add  
        </script>

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<style>
	   

.multiselect {
  width: 280px;
  display:inline-block;
}


.multiselect3 {
  width: 200px;
  display:inline-block;
}


.selectBox {
  position: relative;
  
}

.selectBox select {
  width: 100%;
  font-weight: bold;
}

.overSelect {
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
}

#checkboxes {
  display: none;
  border: 1px #dadada solid;
    height: 150px;
  overflow-y:scroll;
}

#checkboxes label {
  display: block;
}

#checkboxes label:hover {
  background-color: #1e90ff;
}




</style>



<script>
var expanded = false;

function showCheckboxes() {
  var checkboxes = document.getElementById("checkboxes");
  if (!expanded) {
    checkboxes.style.display = "block";
    expanded = true;
  } else {
    checkboxes.style.display = "none";
    expanded = false;
  }
}
</script>


<div align="center" style="min-height:350px;"><br /><br />
    <h3 class="page-title">{{$title}}</h3>    
   
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Type</th>
     <td>
         <input type="text"  name="{{$TABLE}}[ja_type]" style ="width:700px" value="{{$detail.ja_type}}" />
      </td>
    </tr>
   
     <tr>
        <th>Title</th>
        <td>
         <input type="text"  name="{{$TABLE}}[ja_title]" style ="width:700px" value="{{$detail.ja_title}}" />
        </td>
     </tr>
   
    <tr>
        <th>Text</th>
        <td>
       <!--  <input type="text"  name="{{$TABLE}}[ja_text]" style ="width:700px" value="{{$detail.ja_text}}" />-->
         <textarea rows="8" name="{{$TABLE}}[ja_text]" id="editor1" class="ckeditor" >{{$detail.ja_text|stripslashes}}</textarea>
        </td>
     </tr>
   
   <tr>
        <th>Position Applies</th>
        <td>
        <!-- <input type="text"  name="{{$TABLE}}[ja_position]" style ="width:700px" value="{{$detail.ja_position}}" />-->
         <!---------Project Search--------------->
        <div class="multiselect" >
            <div class="selectBox" onclick="showCheckboxes()" >
              <select >
                <option>Select Position</option>
              </select>
              <div class="overSelect"></div>
            </div>
            <div id="checkboxes">
            
            {{foreach from=$posData key="key" item="item"}}
              <label for="one{{$item.p_id}}">
              <input type="checkbox" id="one_{{$item.p_id}}"  name="{{$TABLE}}[ja_position][]" value="{{$item.p_name}}" {{foreach from=$detail.ja_position key="key1" item="item1"}}  {{if $item.p_name eq $item1}} checked="checked"  {{/if}}{{/foreach}}/>
              {{$item.p_name}}
              </label>
            {{/foreach}}
            </div>
        </div>
         
         
        </td>
     </tr>
   
    <tr>
     <th>Last Updated</th>
     <td>
     <input type="text" name="{{$TABLE}}[ja_last_updated]"  value="{{$detail.ja_last_updated}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> 
     </td>
    </tr>
   
   
    <tr>
        <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
        </td>
    </tr>
</table>
</form>
    
    <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("{{$TABLE}}[al_item]","req", "Please specify item.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>
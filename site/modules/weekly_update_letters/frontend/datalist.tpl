<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/ckeditor.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/samples/js/sample.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>

	<!--<link rel="stylesheet" href="styledatalist.css"/>-->
<link rel="stylesheet" href="{{$BASE_URL}}js/datalist/styledatalist.css"/>
<table border="1">
<tr>
<td> Data List Example </td>
<th align="center" >
<form>

<input type="text" list="states123">
	<div style="margin-top:1px; margin-left:20%;">

    <datalist id="states123" style="border:2px solid #F00; position: relative !important;">
     {{foreach from=$templatedocs key="key3" item="item3"}}
        <option value="{{$item3.dhd_name2}}">{{$item3.dh_title}} </option>
     {{/foreach}}

    </datalist>
</div>
</form>
</th>
</tr>
</table>
<!--<script src="datalist.polyfill.min.js"></script>-->
<script type="text/javascript" src="{{$BASE_URL}}js/datalist/datalist.polyfill.min.js"></script>

<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Autocomplete - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    var availableTags = [ {{$data}} ];
    $( "#tags" ).autocomplete({
      source: availableTags
    });
  } );
  </script>
</head>
<body>
 
<div class="ui-widget">
  <label for="tags">Tags: </label>
  <input id="tags">
</div>
 
 
</body>
</html>

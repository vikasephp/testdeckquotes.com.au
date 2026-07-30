<?php
$table = new Fw_Db_Table('warranty_liability_acceptance');
date_default_timezone_set("Australia/Sydney");
$submit = $fwRequest->getParam('wapsubmit', '');

 	$wa_id = $fwRequest->getparamget('wa_id','');
	$comp = $fwRequest->getParam('comp', '');
	$eml = $fwRequest->getparamget('eml','');
    $fwViewData['wa_id']  = $wa_id;
    $fwViewData['comp']  = $comp;
	$fwViewData['eml']  = $eml;
	
	$sql = "select wa_problem from warranty_log where wa_id = ".$wa_id;
	$prbdata = $fwDb->queryOne($sql);
	$fwViewData['problem'] = stripslashes($prbdata['wa_problem']);
	    //$url = "https://www.deckquotes.com.au/wap/wap.htm/?comp=Capital%20Certifiers123&eml=info@capitalcertifiers.com.au";
	  
	    //$parts = parse_url($url);
		//parse_str($parts['query'], $query);
		//db($query['comp']);
		//db($query['eml']);

if(!empty($submit))
{
  	$wapdetail = $fwRequest->getParam('wap', array());
	$opr = $table->insertRow($wapdetail); 
	
	//db($wapdetail);
	
	
	$fwViewData['message'] = "Your details has been saved successfully....";
	
}


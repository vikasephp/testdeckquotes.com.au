<?php

	$sqltdocs = "Select template_docs.dh_title, template_hub_docs.dhd_name2 from template_docs
	             Inner Join template_hub_docs On template_docs.dh_uid = template_hub_docs.dhd_dh_id
				 Order By template_docs.dh_uid";

	
	$templatedocs = $fwDb->query($sqltdocs);
	$fwViewData['templatedocs'] = $templatedocs;
	
	$data='';
	foreach($templatedocs as $k => $v)
	{
		$data .= '"'. $v['dhd_name2'] .'|'. $v['dh_title']   . '",';
  	}
	$fwViewData['data'] =  $data;
	
	//db($data);
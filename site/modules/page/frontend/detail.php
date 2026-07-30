<?php
$page_id = (int)$fwRequest->getparam('page_id', 0);

if($page_id > 0)
	{
		$tablePages = new Fw_Db_Table('pages1');
		$tablePages->setWhere("page_id = $page_id");
		$detail = $tablePages->getRow();
		$detail['page_body'] = stripslashes($detail['page_body']); 
		$fwViewData['detail'] = $detail;
		$fwViewData['title'] = $fwViewData['detail']['page_title'];
		$fwViewData['breadcrumb_title'] = $fwViewData['detail']['page_title'];
		
		
	}else{Location(BASE_URL."404.detail");}
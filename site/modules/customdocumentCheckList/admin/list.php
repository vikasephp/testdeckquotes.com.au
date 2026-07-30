<?php

$tableDocCheck = new Fw_Db_Table($TABLE);
$current_business_status = $fwRequest -> getParam('current_business_status','');
$pdt = 0;
$submit = $fwRequest->getParam('psub', '');

if(!empty($submit))
{
	//$pdt = $fwRequest -> getParam('project','');	
	$clt = $fwRequest -> getParam('ckecklisttype','');
	$fwViewData['pdt'] = $pdt;
	$fwViewData['clt'] = $clt;
}

//if($pdt > 0 and $clt > 0)
//{
//	$sql = "Select ".$TABLE.".* ,  project_type.* FROM ".$TABLE. 
//	   " left join project_type on ".$TABLE.".admin_doc_proj_type = project_type.pt_id
//	    where admin_custom_document_check_list.admin_cdoc_type LIKE '%".$clt."%' and project_type.pt_id = ".$pdt ;
//}

if($clt > 0)
{
		$sql = "Select ".$TABLE.".* ,  project_type.* FROM ".$TABLE. 
	   " left join project_type on ".$TABLE.".admin_doc_proj_type = project_type.pt_id
	    where admin_custom_document_check_list.admin_cdoc_type LIKE '%".$clt."%'" ;
}

//elseif($pdt > 0)
//{
//	$sql = "Select ".$TABLE.".* ,  project_type.* FROM ".$TABLE. 
//	   " left join project_type on ".$TABLE.".admin_doc_proj_type = project_type.pt_id where project_type.pt_id = ".$pdt ;
//}
else
{
		$sql = "Select ".$TABLE.".* ,  project_type.* FROM ".$TABLE. 
	   " left join project_type on ".$TABLE.".admin_doc_proj_type = project_type.pt_id" ;
}


$data = $fwDb->query($sql);

foreach($data as $k=>$v)
{
	$detail =  explode("|",$v['admin_cdoc_type']);
	$str = '';
	foreach($detail as $k1=>$v1)
	{
		if($v1==1)
			$str .= " Document Check List - A <br>";
		elseif($v1 == 2)
			$str .= " Document Check List - B <br>";	
		elseif($v1 == 3)
			$str .= " Document Check List - C <br>";
		elseif($v1 == 4)
			$str .= " Document Check List - D <br>";		
	}
	
$data[$k]['admin_cdoc_type'] = $str;
}

$fwViewData['doc'] = $data;
//$fwViewData['doc'] = $fwDb->query($sql);		

/**** End doc related to business status ***/

$msg =  $fwRequest -> getParam('msg','');

if($msg == 1)
{
	$msg = "One Record Updated Successfully";
}

elseif($msg == 2)
{
	$msg = "One Record Inserted Successfully";
}

$fwViewData['msg'] = $msg;
$fwViewData['title'] = $MODULE_PLURAL;

$psql = "select * from project_type";
$fwViewData['projdata'] = $fwDb->query($psql);
<?php
$tablePages = new Fw_Db_Table($TABLE);
$tablePages->setOrderBy($ID.' ASC');
$catdata=$tablePages->getAllRows();
$fwViewData['list'] = $catdata; 
$fwViewData['title'] = $MODULE_PLURAL;


//$tablePR = new Fw_Db_Table('person_responsible_detail');
//
//$sql = "Select Distinct prd_bsn_id from person_responsible_detail";
//$data  = $fwDb->query($sql);
//
//foreach($data as $k=>$v)
//{
//	foreach($catdata as $k1=>$v1)
//	{
//			
//		$tablePR->setWhere('prd_bsn_id = '.$v['prd_bsn_id'] . " AND prd_position = '". $v1['prm_position']."'");
//		if(!$tablePR->rowExists())	
//		{
//			$prdetail['prd_bsn_id'] = $v['prd_bsn_id'];
//			$prdetail['prd_prm_id'] = $v1['prm_id'];
//			$prdetail['prd_stream'] = $v1['prm_stream'];
//			$prdetail['prd_position'] = $v1['prm_position'];
//			$tablePR->insertRow($prdetail);
//		}
//	}
//}


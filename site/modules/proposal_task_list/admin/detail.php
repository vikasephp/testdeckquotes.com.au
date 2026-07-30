<?php
$tabletasks = new Fw_Db_Table($TABLE);
$tablebusness_status = new Fw_Db_Table('busness_status');
$tablebusiness_tasks = new Fw_Db_Table('proposal_tasks');
$tablebusiness_tasks_order = new Fw_Db_Table('proposal_task_list_orders');
$tablebusness_types = new Fw_Db_Table('project_type');
$tablebusness_auth_area = new Fw_Db_Table('authorizearea');
$tablebusness_data_fields = new Fw_Db_Table('datafields');
$tablepositions = new Fw_Db_Table('positions');

$tablebusiness_sub_tasks = new Fw_Db_Table('proposal_task_list_subtask');
$tablebusiness_email_link = new Fw_Db_Table('proposal_task_list_email_link');
$tablelinked_procedure = new Fw_Db_Table('proposal_task_list_subtask_lp');
$tabletaskproc = new Fw_Db_Table('proposal_task_list_procedures');

$submit = $fwRequest->getParam('subAddDetail', '');
$fwViewData['authorizearea'] = $tablebusness_auth_area->getAllRows();	
$fwViewData['datafields'] = $tablebusness_data_fields->getAllRows();		
$btnassignTasks = $fwRequest->getParam('btnassignTasks', '');
	
if(!empty($btnassignTasks)):
	$data = $fwRequest -> getParam('data','');

foreach($data['bst_business_types'] as $key => $val){ if($val > 0): $keys[] = $key; endif; }
	if(count($keys) > 0):	
	$ptids = implode(",", $keys); 
	$psql = "SELECT bsn_id FROM business WHERE bsn_type IN ({$ptids})";
	$pdata =  $fwDb->query($psql);
	endif;



	if(count($pdata) > 0)
   	  {
	  	  $count=0;
			foreach($pdata as $val)
					{
					$tablebusiness_tasks->setWhere("bt_bsn_id = {$val['bsn_id']} AND bt_task_id = {$data['bst_id']}");
					if(!$tablebusiness_tasks->rowExists())
						{
						$adddata['bt_bsn_id'] = $val['bsn_id'];
						//$adddata['bt_task_status_id'] = $data['bst_business_status_id'];
						$adddata['bt_task_id'] = $data['bst_id'];
						$adddata['bst_posid'] = $data['bst_posid'];
						$tablebusiness_tasks->insertRow($adddata);	
						$count++;
						}
					}
	  }
$fwViewData['taskmsg'] = $count;
endif;

if(!empty($submit))
{
$data = $fwRequest -> getParam('data','');
$data2 = $fwRequest -> getParam('data2','');
$data3 = $fwRequest -> getParam('data3','');

$linked_procedure = $fwRequest -> getParam('linked_procedure','');

$data['bst_task_name'] = stripslashes($data['bst_task_name']);

$bst_id = $fwRequest -> getParam('bst_id');


if($linked_procedure) {

		foreach($linked_procedure as $lpk => $lpv)
		{
			$m='';
			$c = count($lpv);
			$i=0;
			
			foreach($lpv as $key => $ll)
			{
			  if($ll) {	
			   $dt = explode('-',$ll);	
			   $m  = trim($dt[0]);
			   $linkDetail['bstlp_bsst_id'] = $lpk;
			   $linkDetail['bstlp_bst_id'] = $bst_id;
			   $linkDetail['bstlp_doc_name'] = $m;
			   $linkDetail['bstlp_option_text'] = $ll;
			   $tablelinked_procedure->insertRow($linkDetail);
			  }
			}
		}
}




$data['bst_instruction'] = stripslashes($data['bst_instruction']);
if($data['bst_business_types']){ $data['bst_business_types']= serialize($data['bst_business_types']); }
	if($_FILES['image']['error'] == 0)
	{
		$docfile = $_FILES['image']['name'];
		$file_type = $_FILES['image']['type'];
		
		$datetime = trim(date('d_m_Y_H_i_'),'0');
		$docfile = $datetime.preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
		$src = $_FILES['image']['tmp_name'];
		$destination = BASE_DIR.FILE_PATH.'files/task_files/'.$docfile;
		
							
		if (!move_uploaded_file($src, $destination))
		{
			echo "Possible file upload attack";
		}
		else
		{
			$data['bst_document']= $docfile;
			chmod($destination, 0664);
		}
	}

	//if(!empty($data['bst_business_status_id']) AND empty($data['bst_id']))
	//{
	//	$_SESSION['current_bst_business_status_id'] = $data['bst_business_status_id'];
	//}

	if($data['bst_task_id'] > 0)
	  {
		$tabletasks->setWhere("bst_task_id = {$data['bst_task_id']} && bst_id != {$bst_id}");
		if($tabletasks->rowExists()){
		$bst_tasks_error = "Tasks UID already assigned.";
		}
		
	  }	  
  if(!$bst_tasks_error){	
  
  
	if($data['bst_id']>0)
	{
		
		$bst_id = $data['bst_id'];
		
		unset($data['bst_id']);
		$tabletasks->setWhere("bst_id = $bst_id");
		$update = $tabletasks->updateRow($data);
			if($data2)
			{
				
					foreach($data2 as $v)
					{
						$sub['bsst_bst_id'] = $bst_id;
						//$sub['bsst_business_status_id'] = $data['bst_business_status_id'];
						$sub['bsst_task_name'] = $v;
						$stask = $tablebusiness_sub_tasks->insertRow($sub);
					}
			}
			
			if($data3)
			{
				
					foreach($data3 as $v)
					{
						$ed = explode("|",$v);
						$email['pel_task_id'] = $bst_id;
						//$email['pel_email_linked'] = $v;
						$email['pel_email_linked'] = $ed[0];
						$email['pel_email_id'] = $ed[1];
						$stask = $tablebusiness_email_link->insertRow($email);
					}
			}
			
			
			if($data['bst_task_doc_link'])
			{
				foreach($data['bst_task_doc_link'] as $km=>$kv)
				{
					 
					   $dt = explode('-',$kv);	
					   $m  = trim($dt[0]);
					   $detailProcedure['btp_bst_id'] = $bst_id ;	
					   $detailProcedure['btp_doc'] = $m; 
					   $detailProcedure['btp_doc_longtext'] = $kv; 
					   $tabletaskproc->insertRow($detailProcedure);
				}
			}
						
			
			
	}
	else
	{
		$sql = "SELECT MAX(bst_order) as maxbsts FROM proposal_task_list" ;
		$maxdata = $fwDb->queryOne($sql);
		$data['bst_order'] = (int)$maxdata['maxbsts'] +1;
		
		$sql = "SELECT MAX(bst_id) as maxbstid FROM proposal_task_list";
		$maxdata = $fwDb->queryOne($sql);
		$data['bst_task_id'] = (int)$maxdata['maxbstid'] +1;
		
		$insert = $tabletasks -> insertRow($data);
		if($data['bst_business_types']):
		$typeids = unserialize($data['bst_business_types']);		
		foreach($typeids as $key =>$val):
		$sql = "SELECT MAX(business_status_task_orders_tasks_oid) as maxord FROM proposal_task_list_orders WHERE business_status_task_orders_type_id = ".$key;
		$maxdata = $fwDb->queryOne($sql);
		$orddata['business_status_task_orders_tasks_oid'] = (int)$maxdata['maxord'] +1;
		$orddata['business_status_task_orders_type_id'] = $key;
		//$orddata['business_status_task_orders_status_id'] = $data['bst_business_status_id'];
		$orddata['business_status_task_orders_tasks_id'] = $insert;
		$tablebusiness_tasks_order -> insertRow($orddata);
		endforeach;
		endif;
		
		if($data2)
		{
			foreach($data2 as $v)
				{
					$sub['bsst_bst_id'] = $insert;
					$sub['bsst_task_name'] = $v;
					$stask = $tablebusiness_sub_tasks->insertRow($sub);
				}
		}
		
		if($data3)
		{
			foreach($data3 as $v)
				{
					$email['pel_task_id'] = $insert;
					$email['pel_email_linked'] = $v;
					$stask = $tablebusiness_email_link->insertRow($email);
				}
		}
		
		
		if($data['bst_task_doc_link'])
			{
				foreach($data['bst_task_doc_link'] as $km=>$kv)
				{
					   $dt = explode('-',$kv);	
					   $m  = trim($dt[0]);
					   $detailProcedure['btp_task_id'] = $insert ;	
					   $detailProcedure['btp_doc'] = $m; 
					   $detailProcedure['btp_doc_longtext'] = $kv; 
					   $tabletaskproc->insertRow($detailProcedure);
				}
			}
		
		
	}
		
	if($update){ $i = 1; }else{	$i= 2; }
	
	Location(BASE_URL . $XFA["list"]."/msg/$i");
}else{
$fwViewData['bst_tasks_error'] = $bst_tasks_error;
}	
}	

/****** Begin fetch busness_status for dropdown*********/
$busness_status = $tablebusness_status->getRows();
$fwViewData['busness_status'] = $busness_status;
/****** End fetch busness_status for dropdown*********/

/****** Begin fetch busness_status for dropdown*********/
$busness_types = $tablebusness_types->getRows();
$fwViewData['busness_types'] = $busness_types;
/****** End fetch busness_status for dropdown*********/

/****** Begin fetch busness_status for dropdown*********/
$tablepositions->SetWhere("p_status = 1");
$tablepositions->setOrderBy('p_name ASC');
$fwViewData['positions'] = $tablepositions->getRows();
/****** End fetch busness_status for dropdown*********/

$bst_id = $fwRequest -> getParam('bst_id');

if ($bst_id > 0)
{
	$tablecats = new Fw_Db_Table($TABLE);
	$tablecats->setWhere("$ID = $bst_id");
	$detail = $tablecats->getRow();
	if($detail['bst_business_types']){ $detail['bst_business_types']= unserialize($detail['bst_business_types']); }

	$fwViewData['detail'] = $detail;
	
	//$fwViewData['docdetail'] = explode(',',$detail['bst_task_doc_link']);
	
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
	//unset($_SESSION['current_bst_business_status_id']);
	
	$tablebusiness_sub_tasks->setWhere("bsst_bst_id = $bst_id");
	$fwViewData['subtask_detail'] = $tablebusiness_sub_tasks->getRows();
	
	//$tablelinked_procedure->setWhere("bsst_bst_id = $bst_id");
	$fwViewData['subtask_detail_lp'] = $tablelinked_procedure->getRows();
	$fwViewData['bst_id'] =  $bst_id;
	
	$tabletaskproc->setWhere("btp_bst_id =".$bst_id);
	$fwViewData['docdetail'] =  $tabletaskproc->getRows();
	
	$tablebusiness_email_link->setWhere("pel_task_id = $bst_id");
	$fwViewData['emaillink_detail'] = $tablebusiness_email_link->getRows();
	
	
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
	//if($_SESSION['current_bst_business_status_id']>0){$fwViewData['current_bst_business_status_id'] = $_SESSION['current_bst_business_status_id'];}
}

	$tableTemplateDocHub = new Fw_Db_Table('template_hub_docs');
	$fwViewData['templatedetail'] = $tableTemplateDocHub->getRows();
	
	$tableTemplateDocHub = new Fw_Db_Table('template_docs');
	//$fwViewData['template_docdetail'] = $tableTemplateDocHub->getRows();

    $sqltdh = "Select template_docs.* , template_hub_docs.dhd_name2 from template_docs
		 inner join template_hub_docs on template_docs.dh_id = template_hub_docs.dhd_dh_id";
	
	$fwViewData['template_docdetail'] = $fwDb->query($sqltdh);	
	
	$sqlec = "Select * from emaillibrary order by eml_code"; 
	$fwViewData['email_code'] = $fwDb->query($sqlec);
		 
<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');

$cd = date("d-m-Y");
$user = $_SESSION['user']['user_name'];

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];

    $sql = "Select bsn_id from business where bsn_name = '".$detail['rt_project_address']."'";
	$bsndata = $fwDb->queryOne($sql);
	
	$detail['rt_bsn_id'] = $bsndata['bsn_id'];

	unset($detail[$ID]);
	
	$detail['rt_last_change'] = $cd;
	$detail['rt_modified_by'] = $user;
	
	
    if($this_id > 0)
    	{
		
       		 $tableqa->setWhere("$ID = $this_id");
	     	 $opr = $tableqa->updateRow($detail);
			 $fwViewData['opr'] = $opr;
    	}
	else
	{	
		 $opr = $tableqa->insertRow($detail); 
	    	
    
	
	
			$fwViewData['opr'] = $opr;
				
			$sql2 = "Select * from report_builder_admin where ra_rb_id = ".$detail['rt_report_type']. " order by ra_id";
			$admindata = $fwDb->query($sql2);
			
			$tablemain = new Fw_Db_Table('report_table_main');
			
			foreach($admindata as $k=>$v)
			{
				
				$tablemain->setWhere("mr_admin_id  = ".$v['ra_id']. " and  mr_report_id = ".$opr);
				
				if(!$tablemain->rowExists())  {
				 
					$detail2['mr_admin_id'] = $v['ra_id'];
					$detail2['mr_report_id'] = $opr;
					$detail2['mr_bus_id'] = $bsndata['bsn_id'];
					$detail2['mr_order'] = $v['ra_order'];
					$detail2['mr_name'] = $v['ra_name'];
					$detail2['mr_specification'] = $v['ra_specification'];
					$detail2['mr_status'] = $v['ra_status'];
					$detail2['mr_criteria'] = $v['ra_criteria'];
					
					$opr2 = $tablemain->insertRow($detail2);
				}
				
			}
		
	}
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0)
{
	
	$tableqa = new Fw_Db_Table($TABLE);
	$tableqa->setWhere("$ID = $this_id");
    $detail = $tableqa->getRow();
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;	
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	

$sql = "SELECT  bsn_name from business where bsn_sub_status = 'Open'";
$fwViewData['projdetail'] = $fwDb->query($sql);

$sql = "SELECT  *  from report_build ";
$fwViewData['typedetail'] = $fwDb->query($sql);

$sql_designer ="SELECT DISTINCT prd_name FROM person_responsible_detail
       WHERE `prd_position` = 'designer' ";
$fwViewData['des_data'] = $fwDb->query($sql_designer);
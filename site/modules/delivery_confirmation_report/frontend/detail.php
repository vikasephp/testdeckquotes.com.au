<?php

$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);
$fwViewData['wa_id'] = (int)$fwRequest->getParam('wa_id', 0);
$submit = $fwRequest->getParam('subAddDetail', '');

$table = new Fw_Db_Table('warranty_log_detail_task');
$yesno = $fwRequest->getParam('yesno', '');

$user_name = $_SESSION['user']['user_name'];


 
if($yesno)
{
	 foreach($yesno as $k=>$v)
	 {
		  $id = $k; 
	 }
	 
	  $detailTask['wd_yes_no'] = $v;
	  $detailTask['wd_date'] = date('d-m-Y');
	  $table->setWhere('wt_id = '.$id);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detailTask);
	  }

}


if(!empty($submit))
{
    	$detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];

	unset($detail[$ID]);
	
		
		if($_FILES['delivery_pdf']['name'])
		{
				
				$docfile_2 = $_FILES['delivery_pdf']['name'];
				$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
				$temp_name_2 = $_FILES['delivery_pdf']['tmp_name'];
				$detail['dc_del_pdf'] = $docfile_2;
				upload($docfile_2, $temp_name_2);
		}
	
	
    if($this_id > 0)
    	{
       		 $tableqa->setWhere("$ID = $this_id");
	     	 $opr = $tableqa->updateRow($detail);   
    	}
		else
		{
			 $opr = $tableqa->insertRow($detail); 
		}    	
	    		$fwViewData['opr'] = $opr;
		
		//Location(BASE_URL . $XFA['home']);
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

 
//$sql = "SELECT  business.* from business LIMIT 500";
//$result = mysqli_query($MySqliCon, $sql);
//
////$fwViewData['projdetail'] = $fwDb->query($sql); 
//
//while( $row = mysqli_fetch_assoc( $result ) )
//    {
//      $all_data_arr[] = $row ;
//    }
//    
//
//$fwViewData['projdetail'] =  $all_data_arr; 

$sql = "SELECT business.bsn_id, business.bsn_name from business ";
$fwViewData['projdetail'] = $fwDb->query($sql);


//echo "<pre>";print_r($fwViewData['projdetail']);  

//exit;

$sql_c = "Select * from delivery_conf_status";


$result = mysqli_query($MySqliCon, $sql_c);


while( $row = mysqli_fetch_assoc( $result ) )
    {
      $all_data_arr5[] = $row ;
    }
    
$fwViewData['statusdetail'] = $all_data_arr5; //$fwDb->query($sql_c); 



$sql_ow = "Select * from delivery_conf_owner";

$result = mysqli_query($MySqliCon, $sql_ow);


while( $row = mysqli_fetch_assoc( $result ) )
    {
      $all_data_arr2[] = $row ;
    }
$fwViewData['ownerdetail'] = $all_data_arr2;  //$fwDb->query($sql_ow);


$sql_ev = "Select * from delivery_conf_event";

$result = mysqli_query($MySqliCon, $sql_ev);


while( $row = mysqli_fetch_assoc( $result ) )
    {
      $all_data_arr3[] = $row ;
    }
$fwViewData['eventdetail'] =$all_data_arr3;  //$fwDb->query($sql_ev);



$sql_wo = "Select * from delivery_conf_who";

$result = mysqli_query($MySqliCon, $sql_wo);


while( $row = mysqli_fetch_assoc( $result ) )
    {
      $all_data_arr4[] = $row ;
    }
$fwViewData['whodetail'] = $all_data_arr4;  //$fwDb->query($sql_wo);



$sqlpo = "Select po_po_number  from purchase_order where length(po_po_number) > 0";

$result = mysqli_query($MySqliCon, $sqlpo);


while( $row = mysqli_fetch_assoc( $result ) )
    {
      $all_data_arr5[] = $row ;
    }
    
$fwViewData['podetail'] = $all_data_arr5;  //$fwDb->query($sqlpo);






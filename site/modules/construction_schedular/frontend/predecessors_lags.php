<?php
$fwMainView = 'file:' . getcwd() . '/predecessors_lags.tpl';
$tableTask = new Fw_Db_Table('pp_lb_planning');
$table = new Fw_Db_Table('predecessors_lags');
$csid = (int)$fwRequest->getParam('cs_id', 0);

$sql = "select cs_id, cs_event_name from construction_schedular";
$fwViewData['eventData'] = $fwDb->query($sql);

$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam('pre_lag', array());
	$this_id = (int)$detail[$ID];
    $detail['pl_cs_id'] = $csid;
  
	unset($detail[$ID]);
		
       	$table->setWhere("pl_cs_id = $csid");
		if($table->rowExists())
		{	 
	     	 $opr = $table->updateRow($detail);
    	}
		else
		{	
			 $opr = $table->insertRow($detail); 
		}    	
    
	   $sql = "Select * from construction_schedular where cs_id = ".$detail['pl_ev_id'];
	   $csData = $fwDb->queryOne($sql);
	 
	   $type = $detail['pl_type'];
	   $start_date = $csData['cs_start_date'];
	   $end_date = $csData['cs_end_date'];
	
	   //db($detail);
	   //exit;
	   
	   if($type == 'FS')
	   {
		   $sqlA = "Select * from construction_schedular where cs_id = ".$detail['pl_cs_id'];
		   $dataA = $fwDb->queryOne($sqlA);
		 
		   
		    $dt1 = $dataA['cs_start_date'];
			$dt2 = $dataA['cs_end_date'];
			$dayscount = daysDifference($dt2, $dt1);
		    
			if($detail['pl_lag'] >= 0 ) {
				$m = 1 + (int) $detail['pl_lag'];
		 
			 	$newdate = strtotime ( '+ '.$m . ' day ' , strtotime($end_date) ) ;
		   		$s_dt = date('d-m-Y',$newdate);
		   } else {
			   
			    $m = 1 + (int) $detail['pl_lag'];
	
			 	$newdate = strtotime ( $m . ' day ' , strtotime($end_date) ) ;
		   		$s_dt = date('d-m-Y',$newdate);
		   }
		   
		   
		   $new_end = strtotime ( "+ ".$dayscount .' day' , strtotime ( $s_dt ) ) ;
		   $e_dt = date('d-m-Y',$new_end);
		   
		   $sql2 = "update construction_schedular set cs_start_date = '".$s_dt."' where cs_id = ".$detail['pl_cs_id'];
		   $fwDb -> queryOne($sql2);
		   
		   if(!empty($dt2)) {
		  	 $sql22 = "update construction_schedular set cs_end_date = '".$e_dt."' where cs_id = ".$detail['pl_cs_id'];
		  	 $fwDb -> queryOne($sql22);
		   }
		   		   
	     } elseif($type == 'FF'){
		  
		  	if($detail['pl_lag'] >= 0 ) {
				$m =  (int) $detail['pl_lag'];
		 
			 	$newdate = strtotime ( '+ '.$m . ' day ' , strtotime($end_date) ) ;
		   		$end_dt = date('d-m-Y',$newdate);
		   } else {
			   
			    $m =  (int) $detail['pl_lag'];
	
			 	$newdate = strtotime ( $m . ' day ' , strtotime($end_date) ) ;
		   		$end_dt = date('d-m-Y',$newdate);
		   }
		  
		  		  
		     $sql3 = "update construction_schedular set cs_end_date = '".$end_dt."' where cs_id = ".$detail['pl_cs_id'];
		     $fwDb -> queryOne($sql3); 
		   
	   } elseif($type == 'SS'){
		  //  $sql4 = "update construction_schedular set cs_start_date = '".$start_date."' where cs_id = ".$detail['pl_cs_id'];
		  //  $fwDb -> queryOne($sql4);
		   
	   } elseif($type == 'SF'){
		   
	   }
	   
	  
	  
	
         $fwViewData['opr'] = $opr;		
}

$this_id = (int)$fwRequest->getParam('cs_id', 0);


if ($this_id > 0)
{
	
	$table1 = new Fw_Db_Table('predecessors_lags');
	$table1->setWhere("pl_cs_id = $this_id");
    $detail = $table1->getRow();
		
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;	
}
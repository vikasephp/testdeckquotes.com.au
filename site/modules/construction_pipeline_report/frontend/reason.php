<?php
$fwMainView = 'file:' . getcwd() . '/reason.tpl';
$table = new Fw_Db_Table('business_sellers');
$bsn_id = $fwRequest->getParam('bsn_id', 0);

$a = $fwRequest->getParam('a', 0); 

$fwViewData['bsn_id']= $bsn_id;


 
      if($a==1) {
                 $sqlreason = "Select business_sellers.bs_tl_plann_reason   from  business_sellers
	                       where business_sellers.bs_business_id = ".$bsn_id;
			       

       $reasonData = $fwDb->queryOne($sqlreason);
       $fwViewData['reasonData'] = $reasonData['bs_tl_plann_reason'];
			       
      } elseif($a==2) {
	   
	         $sqlreason = "Select business_sellers.bs_tl_incl_reason   from  business_sellers
	                       where business_sellers.bs_business_id = ".$bsn_id; 
			       
			       
        $reasonData = $fwDb->queryOne($sqlreason);
	$fwViewData['reasonData'] = $reasonData['bs_tl_incl_reason'];			         
      }
     

     
    
	 
		 
 
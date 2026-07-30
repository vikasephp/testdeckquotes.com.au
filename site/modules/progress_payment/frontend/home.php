<?php

$submit = $fwRequest->getParam('updatepp', '');
$table = new Fw_Db_Table('progress_payment_detail');

if(!empty($submit))
{
    	$detail = $fwRequest->getParam('pp', array());
	
	$bsn_id = $detail['bsn_id'];
	$stage = $detail['stage'];
	
			if($_FILES['pp_report']['name'])
			{
				$docfile = $_FILES['pp_report']['name'];
				$file_type = $_FILES['pp_report']['type'];
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
				$src = $_FILES['pp_report']['tmp_name'];
				//$destination = BASE_DIR.'files/progress_payment_doc/'.$docfile;
							
				//move_uploaded_file($src, $destination);
				
				upload_pp_doc($docfile, $src);
			}

			if($_FILES['invoice']['name'])
			{
				$docfile2 = $_FILES['invoice']['name'];
				$file_type2 = $_FILES['invoice']['type'];
				
				$datetime2 = trim(date('d_m_Y_H_i_'),'0');
				$docfile2 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile2);
				$src2 = $_FILES['invoice']['tmp_name'];
				//$destination2 = BASE_DIR.'files/progress_payment_doc/'.$docfile2;
							
				//move_uploaded_file($src2, $destination2);
				
				upload_pp_doc($docfile2, $src2);
			}

	
    if($bsn_id > 0)
    	{
             
	     	 $sql = "Update progress_payment_detail set ppd_signoff_doc = '".$docfile ."'
		        where ppd_bsn_id = ".$bsn_id. " AND ppd_stage = '".$stage."'";
      		
		 $fwDb->queryOne($sql);
		 
		 $sql = "Update progress_payment_detail set ppd_invoice_sent = '".$docfile2 ."'
		        where ppd_bsn_id = ".$bsn_id. " AND ppd_stage = '".$stage."'";
      		
		 $fwDb->queryOne($sql);
		
    	}
	    $fwViewData['opr'] = $opr;
		
	
}

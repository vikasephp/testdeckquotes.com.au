<?php
$fwMainView = 'file:' . getcwd() . '/add_construction_alert.tpl';
$tablecar = new Fw_Db_Table('construction_alert_report');

$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);
$fwViewData['bsn_id'] = $bsn_id;
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam('car', array());
	
	$bsn_id = $detail['bsn_id'];
	unset($detail['bsn_id']);
	
	$detail['car_date'] = date('d-m-Y');
	
	$detail['car_type'] = 'Certifier – Final';
	$detail['car_status'] = 'Open';
	
	if($_FILES['image1']['name'])
		{
				$docfile_1 = $_FILES['image1']['name'];
				$file_type = $_FILES['image1']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$src = $_FILES['image1']['tmp_name'];
		
				
				$detail['car_image1'] = $docfile_1;
				upload($docfile_1, $src);
				
										
		}
		
		if($_FILES['image2'])
		{
				$docfile_2 = $_FILES['image2']['name'];
				$file_type = $_FILES['image2']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_2 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
				$src = $_FILES['image2']['tmp_name'];
				
				$detail['car_image2'] = $docfile_2;
				upload($docfile_2, $src);
				
				
				//$destination = BASE_DIR.'files/uploads/'.$docfile_2;
						
		}
	
		if($_FILES['image3'])
		{
				$docfile_3 = $_FILES['image3']['name'];
				$file_type = $_FILES['image3']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_3 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
				$src = $_FILES['image3']['tmp_name'];
				
				$detail['car_image3'] = $docfile_3;
				upload($docfile_3, $src);
				
						
		}

	
		if($_FILES['image4'])
		{
				$docfile_4 = $_FILES['image4']['name'];
				$file_type = $_FILES['image4']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_4 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_4);
				$src = $_FILES['image4']['tmp_name'];
				
				
				$detail['car_image4'] = $docfile_4;
				upload($docfile_4, $src);
				
						
		}
		
		if($_FILES['image5'])
		{
				$docfile_5 = $_FILES['image5']['name'];
				$file_type = $_FILES['image5']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_5 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_5);
				$src = $_FILES['image5']['tmp_name'];
				
				$detail['car_image5'] = $docfile_5;
				upload($docfile_5, $src);
						
		}
	

     $sqlbus = "Select bsn_name from business where bsn_id = ".$bsn_id;
	 $busdata = $fwDb->queryOne($sqlbus);
    
	 $detail['car_project'] = $busdata['bsn_name'];
	 $detail['car_from_cou'] = 1;
   
	

    $opr = $tablecar->insertRow($detail); 
    	
	$fwViewData['opr'] = $opr;
			
}


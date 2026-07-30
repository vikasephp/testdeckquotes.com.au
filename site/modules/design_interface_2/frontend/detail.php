<?php
//$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableDesignInterface = new Fw_Db_Table($TABLE);
$tableDesignInterfacePricing = new Fw_Db_Table('design_interface_pricing_2');
$tableDesignInterDesignes = new Fw_Db_Table('design_interface_designs_2');
$tabledif = new Fw_Db_Table('design_interface_features_2');
$tablebfpl = new Fw_Db_Table('design_interface_bfpl_2');
$user_id = $_SESSION['user']['user_id'];
$user_name = $_SESSION['user']['user_name'];
$docdel = $fwRequest->getParam('di_doc', '');
$this_id = (int)$fwRequest->getParam($ID, 0);

$tableltype = new Fw_Db_Table('di_2_type_admin');

$fwViewData['typedata'] = $tableltype->getRows();


$addtext = $fwRequest->getParam('addtext', '');
if($addtext)
{
	 $keys_2 = array_keys($addtext);
	 $ky_2 = $keys_2[0];
	 $val_2 = $addtext[$ky_2];
	
	  $detail['di_add_text'] = $val_2;
	  $tabledif->setWhere("dif_id = ".$ky_2);
	  if($tabledif->rowExists())
	  {
		 $this_id = $tabledif->updateRow($detail);
	  }	  	
}


$fwViewData['this_id'] = $this_id;
if($docdel)
{
	    $tableDesignInterface->setWhere("$ID = $this_id");
	    if($docdel == 'di_qr_code') {
		$deldetail['di_qr_code_date'] = ''; 
		$deldetail['di_qr_code_user'] = '';  
	    }
	    $deldetail[$docdel] = '';
            $opr = $tableDesignInterface->updateRow($deldetail);
}

$dd_id_del = $fwRequest->getParam('dd_id_del', '');
if($dd_id_del)
{
	        $tableDesignInterDesignes->setWhere("dd_id = $dd_id_del");
		$tableDesignInterDesignes->deleteRow();
}


$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
	
     $detail = $fwRequest->getParam($TABLE, array());
	
	$chk = $fwRequest->getParam('chk', array());
	if(!empty($chk))
	{
		$chdata = implode(",",$chk);
		$detail['di_checklist_number'] = $detail['di_checklist_number'] .",". $chdata;	
	}
	
	$prdetail = $fwRequest->getParam('pricing', array());	
		
	if($detail['di_compliant_brochure'])
	{ 
		$detail['di_compliant_brochure'] =  1;
	}
	else {  $detail['di_compliant_brochure'] =  0;   }
	
	if($detail['di_price_approved'])
	{ 
		$detail['di_price_approved'] =  1;
	}
	else {  $detail['di_price_approved'] =  0;   }
	
	
	 $detail['di_design_number'] = 'DO-'.$detail['di_design_number_num'];
		
	if($detail['di_qed']) {  $detail['di_qed'] = 1; } else {  $detail['di_qed'] = 0; }
	
	if($detail['di_heating_options']) { 
	$data_he = implode('|', $detail['di_heating_options']);
	$detail['di_heating_options'] = $data_he;
	}
	
	if($detail['di_parking_options']) {
	$data_co = implode('|', $detail['di_cooling_options']);
	$detail['di_cooling_options'] = $data_co;
	}
	
	if($detail['di_parking_options']) {
	$data_pa = implode('|', $detail['di_parking_options']);
	$detail['di_parking_options'] = $data_pa;
	}
	
	$this_id = (int)$detail[$ID];

	unset($detail[$ID]);
	
	
			if($_FILES['proposal']['name'])
			{
				
						$docfile_1 = $_FILES['proposal']['name'];
						$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
						$temp_name_1 = $_FILES['proposal']['tmp_name'];
						$detail['di_proposal'] = $docfile_1;
						upload($docfile_1, $temp_name_1);
						

			}
	// brochure
			if($_FILES['brochure']['name'])
			{
						
						$docfile_2 = $_FILES['brochure']['name'];
						$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
						$temp_name_2 = $_FILES['brochure']['tmp_name'];
						$detail['di_brochure'] = $docfile_2;
						upload($docfile_2, $temp_name_2);
						
			}
	
		// full brochure
			if($_FILES['full_brochure']['name'])
			{
						
						$docfile_3 = $_FILES['full_brochure']['name'];
						$docfile_3 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
						$temp_name_3 = $_FILES['full_brochure']['tmp_name'];
						$detail['di_full_brochure'] = $docfile_3;
						upload($docfile_3, $temp_name_3);						
						
			}
	
		
			if($_FILES['designsummary']['name'])
			{
						
						$docfile_4 = $_FILES['designsummary']['name'];
						$docfile_4 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_4);
						$temp_name_4 = $_FILES['designsummary']['tmp_name'];
						$detail['di_design_summary'] = $docfile_4;
						upload($docfile_4, $temp_name_4);						
						
			}
	
			// Operations Calc
			if($_FILES['opercalc']['name'])
			{
						
						$docfile_5 = $_FILES['opercalc']['name'];
						$docfile_5 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_5);
						$temp_name_5 = $_FILES['opercalc']['tmp_name'];
						$detail['di_operations_calculator'] = $docfile_5;
						upload($docfile_5, $temp_name_5);
						
			}
	
	
			// ma sprojcalc
			if($_FILES['masprojcalc']['name'])
			{
						
						$docfile_6 = $_FILES['masprojcalc']['name'];
						$docfile_6 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_6);
						$temp_name_6 = $_FILES['masprojcalc']['tmp_name'];
						$detail['di_master_project_calculator'] = $docfile_6;
						upload($docfile_6, $temp_name_6);
						
			}
	
	
	// Design Poster
	
		if($_FILES['design_poster']['name'])
			{
						
						$docfile_7 = $_FILES['design_poster']['name'];
						$docfile_7 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_7);
						$temp_name_7 = $_FILES['design_poster']['tmp_name'];
						$detail['di_design_poster'] = $docfile_7;
						upload($docfile_7, $temp_name_7);	
						
			}
	
		// A4 Flyer
	
		if($_FILES['a4_flyer']['name'])
			{
						$docfile_8 = $_FILES['a4_flyer']['name'];
						$docfile_8 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_8);
						$temp_name_8 = $_FILES['a4_flyer']['tmp_name'];
						$detail['di_a4_flyer'] = $docfile_8;
						upload($docfile_8, $temp_name_8);
			}
	
			// Design Postcard
	
			if($_FILES['design_postcard']['name'])
				{
							
							$docfile_9 = $_FILES['design_postcard']['name'];
							$docfile_9 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_9);
							$temp_name_9 = $_FILES['design_postcard']['tmp_name'];
							$detail['di_design_postcard'] = $docfile_9;
							upload($docfile_9, $temp_name_9);
				}
				
			// Website add
	
			if($_FILES['website_add']['name'])
				{
							$docfile_10 = $_FILES['website_add']['name'];
							$docfile_10 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_10);
							$temp_name_10 = $_FILES['website_add']['tmp_name'];
							$detail['di_website_add'] = $docfile_10;
							upload($docfile_10, $temp_name_10);
							
				}
				
			if($_FILES['qrcode']['name'])
			{
				
						$docfile_21 = $_FILES['qrcode']['name'];
						$docfile_21 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_21);
						$temp_name_21 = $_FILES['qrcode']['tmp_name'];
						$detail['di_qr_code'] = $docfile_21;
						$detail['di_qr_code_user'] = $_SESSION['user']['user_name'];
						upload($docfile_21, $temp_name_21);
						

			}	
				
				
			
    if($this_id > 0)
    	{
        $tableDesignInterface->setWhere("$ID = $this_id");
		
		if(!empty($detail['di_proposal'])) { $detail['di_proposal_user'] = $user_name; }
		if(!empty($detail['di_brochure'])) { $detail['di_brochure_user'] = $user_name; }
		if(!empty($detail['di_full_brochure'])) { $detail['di_full_brochure_user'] = $user_name; }
		if(!empty($detail['di_operations_calculator'])) { $detail['di_operations_calculator_user'] = $user_name; }
		if(!empty($detail['di_master_project_calculator'])) { $detail['di_master_project_calculator_user'] = $user_name; }
		
		if(!empty($detail['di_design_summary'])) { $detail['di_design_summary_user'] = $user_name; }
		
        $opr = $tableDesignInterface->updateRow($detail);
		$user_id2 = $_SESSION['user']['user_id'];
		$tableDesignInterfacePricing->setWhere("di_id = ".$this_id);
		if($tableDesignInterfacePricing->rowExists())
		{
			foreach($prdetail as $key => $prd )
				{
					if($prd['dip_approved'] == 'on') { $prd['dip_approved'] = 1; } else { $prd['dip_approved'] = 0; }
					$prd['dip_order'] = $prd['dip_id'];
					unset($prd['di_id']);
					if(!empty($prd['dip_date'])){$prd['dip_date'] = changedate_y_m_d($prd['dip_date']); }
					
					$tableDesignInterfacePricing->setWhere("dip_id = ".$prd['dip_id']);
					$prd2 = $tableDesignInterfacePricing->getRow();
					
					$result = array_diff($prd, $prd2);
					if(count($result) > 0 ) {
						$prd['dip_user'] = $user_id ;
					}
					
					$tableDesignInterfacePricing->updateRow($prd);
					
				}
				
					
		}
		else {
				foreach($prdetail as $key => $prd )
				{
					$prd['dip_order'] = $prd['dip_id'];
					
					unset($prd['dip_id']);
					if($prd['dip_approved'] == 'on') { $prd['dip_approved'] = 1; } else { $prd['dip_approved'] = 0; }
					$prd['di_id'] = $opr;
								
					if(!empty($prd['dip_date'])){$prd['dip_date'] = changedate_y_m_d($prd['dip_date']); }
					$prd['dip_user'] = $user_id ;
					
					$tableDesignInterfacePricing->insertRow($prd);
				}
				
		}
			
			
		Location(BASE_URL . $XFA['home']);   
    	}
		else
		{
			if(!empty($detail['di_proposal'])) { $detail['di_proposal_user'] = $user_name; }
			if(!empty($detail['di_brochure'])) { $detail['di_brochure_user'] = $user_name; }
			if(!empty($detail['di_full_brochure'])) { $detail['di_full_brochure_user'] = $user_name; }
			if(!empty($detail['di_operations_calculator'])) { $detail['di_operations_calculator_user'] = $user_name; }
			if(!empty($detail['di_master_project_calculator'])) { $detail['di_master_project_calculator_user'] = $user_name; }
			if(!empty($detail['di_design_summary'])) { $detail['di_design_summary_user'] = $user_name; }
			
			$opr = $tableDesignInterface->insertRow($detail); 
			 
			 foreach($prdetail as $key => $prd )
				{
					$prd['dip_order'] = $prd['dip_id'];
					unset($prd['dip_id']);
					if($prd['dip_approved'] == 'on') { $prd['dip_approved'] = 1; } else { $prd['dip_approved'] = 0; }
					$prd['di_id'] = $opr;
								
					if(!empty($prd['dip_date'])){$prd['dip_date'] = changedate_y_m_d($prd['dip_date']); }
					$prd['dip_user'] = $user_id ;
					//db($prd);
					$tableDesignInterfacePricing->insertRow($prd);
				}
			 
			 
			 $cb_Data['cb_design_number'] = $detail['di_design_number'];
			 $cb_Data['cb_brochures_sent'] = 0;
			 $cb_Data['cb_brochures_remaining'] = 5;
			 
			 $tablecb_design_brouchures = new Fw_Db_Table('cb_design_brouchures');
			 $tablecb_design_brouchures->insertRow($cb_Data); 
			 
		}    	
		
		
	$fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0)
{
	$tableDesignInterface = new Fw_Db_Table($TABLE);
	$tableDesignInterface->setWhere("$ID = $this_id");
	$detail = $tableDesignInterface->getRow();
	
	$detail['di_heating_options'] = explode("|",$detail['di_heating_options']);
	$fwViewData['he_op'] = $detail['di_heating_options'];
	
	$detail['di_cooling_options'] = explode("|",$detail['di_cooling_options']);
	$fwViewData['co_op'] = $detail['di_cooling_options'];
	
	$detail['di_parking_options'] = explode("|",$detail['di_parking_options']);
	$fwViewData['pa_op'] = $detail['di_parking_options'];
		
	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit Individual Design Interface ';
}
else
{
    $fwViewData['title'] = 'Add Individual Design Interface';
}

	$tableDesignInterfacePricing->setWhere("di_id = ".$this_id);
	if($tableDesignInterfacePricing->rowExists())
	{
 		 $sqldip = "SELECT design_interface_pricing_2.* , users.user_name FROM design_interface_pricing_2
                            LEFT JOIN users ON design_interface_pricing_2.dip_user = users.user_id
                            WHERE di_id = ".$this_id. " Order By design_interface_pricing_2.dip_order ";
		 
		 
		 $dipDetail = $fwDb->query($sqldip);
		 
	
		 foreach($dipDetail as $k => $dpd)
		 {
			$dipDetail[$k]['dip_date'] = changedate_d_m_Y($dpd['dip_date']);	 
		 }
		
		 $fwViewData['dipDetail'] = $dipDetail;
		 
	}

	 $sqldt1 = "select * from design_interface_pricing_2 where di_id = ".$this_id . " AND dip_component like '%Rounded Total Price Total%' ";
     $dtDetail1 = $fwDb->queryOne($sqldt1);
     $fwViewData['last_priced_date'] = $dtDetail1['dip_date'];
     $fwViewData['total_price'] = $dtDetail1['dip_value_entered'];
	 
	 $sqlgp = "select * from design_interface_pricing_2 where di_id = ".$this_id . "  AND dip_component = 'GP Value'";
     $gpDetail = $fwDb->queryOne($sqlgp);
     $fwViewData['gp_value'] = $gpDetail['dip_value_entered'];
 
	
	 $sqlteam = "select * from design_interface_edropbox_2 where didb_di_id = ".$this_id . " AND didb_foldername like '%Team%' ";
     $teamDetail = $fwDb->queryOne($sqlteam);
     $fwViewData['ms_team'] =  str_replace("!",'/',$teamDetail['didb_filepath']);
    
	$tabledipMaster = new Fw_Db_Table('design_interface_pricing_master_2');
	$tabledipMaster->setOrderBy('dipm_id'.' ASC');
	
	$fwViewData['dipmDetail'] = $tabledipMaster->getRows();	
	
	$tablekeyfeature = new Fw_Db_Table('design_interface_keyfeatures');
	$fwViewData['keyfeatures'] = $tablekeyfeature->getRows();
	
	$tableicon_list = new Fw_Db_Table('icon_list');
	$fwViewData['icon_list'] = $tableicon_list->getRows();	
		
	$tablefeature = new Fw_Db_Table('design_interface_features_2');
	$tablefeature->setWhere('dif_di_id ='.$this_id);
	$tablefeature->setOrderBy('dif_id'.' ASC');
	$fwViewData['di_features'] = $tablefeature->getRows();
	
	$tablelegend = new Fw_Db_Table('design_interface_bfpl_2');
	$tablelegend->setWhere('dib_di_id ='.$this_id);
	$tablelegend->setOrderBy('dib_id'.' ASC');
	$fwViewData['di_legend'] = $tablelegend->getRows();
	
	$tabledropbox =  new Fw_Db_Table('design_interface_edropbox_2');
	
	
	$tabledropbox->setWhere('didb_di_id ='.$this_id);
        $di_dropbox = $tabledropbox->getRows();
	

	foreach($di_dropbox as $dk => $dv)
	{
		//db($dv['didb_filepath']);
		$di_dropbox[$dk]['didb_filepath'] = str_replace("=",'\\',$di_dropbox[$dk]['didb_filepath']);	
	}
	
	foreach($di_dropbox as $dk => $dv)
	{
		//db($dv['didb_filepath']);
		$di_dropbox[$dk]['didb_filepath'] = str_replace("!",'/',$di_dropbox[$dk]['didb_filepath']);	
	}
	
	 
	$fwViewData['di_dropbox'] = $di_dropbox;

// Upload Design Images Section



$submitImg = $fwRequest->getParam('uploaddesign', '');
if(!empty($submitImg))
{
	
	
	$tableDesignInterDesignes = new Fw_Db_Table('design_interface_designs_2');
	$des_id = $fwRequest->getParam('d_id', '');
	
	
	if($_FILES['design_img']['name'])
				{
							$docfile_11 = $_FILES['design_img']['name'];
							$docfile_11 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_11);
							$temp_name_11 = $_FILES['design_img']['tmp_name'];
							$detailDesign['dd_di_id']= $des_id;
							$detailDesign['di_design_image']= $docfile_11;
							
							upload($docfile_11, $temp_name_11);
							
							
							$tableDesignInterDesignes->insertRow($detailDesign); 
						 						
				}
					Location(BASE_URL . $XFA['detail']."/di_id/".$des_id); 
}


function get_image_raw_data($zipfile)
{
        $filetoinclude = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php';
	    include_once $filetoinclude;
	     $s3 = new S3('AKIA2AMNCYNNR3C7ELXP', 'ut4HuWX5HovWcxoCaU8gSSE27/RBxidTIh3SqYe2');
        	 try {
        $bucket_name  = "deckquote";
    	$file_data = $s3->getObject($bucket_name,'files/design_interface_2/'.$zipfile, $saveTo = false); 
    //	echo "<pre>";print_r($file_data);  
    	$file_data = $file_data->body;
    	$type = pathinfo($zipfile, PATHINFO_EXTENSION);
       return $base64 = 'data:image/' . $type . ';base64,' . base64_encode($file_data);
    	 
        } catch (ErrorException $ex) {
            //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
        echo $ex->getLine();
            return false;
        }
}


$di_id = $fwRequest->getParam('di_id', '');

if(!empty($di_id)) {
	$tableDesignInterDesignes = new Fw_Db_Table('design_interface_designs_2');
	$tableDesignInterDesignes->setWhere("dd_di_id = ".$di_id);
	
	if($tableDesignInterDesignes->rowExists()) {
		$designDetail  = $tableDesignInterDesignes->getRows();
		foreach ($designDetail as $key => $value) {
		     $filename = $value['di_design_image'];
            $img_data =  get_image_raw_data($filename); 
            $designDetail[$key]['di_design_img_data'] = $img_data;
          }
		
		$fwViewData['designDetail'] = $designDetail;	
	}
	
}


$key = $fwRequest->getParam('key', '');

if(!empty($key))
{
	
	
	$did = $fwRequest->getParam('did', '');
	$detail_key['dif_di_id'] = $did;
	$detail_key['dif_key_feature'] = $key;
	
	$sql_1 = "Select ic_icon_image, ic_icon_text from icon_list where ic_icon_name = '".$key ."'";	
	$data  = $fwDb -> queryOne($sql_1);
	
	if(!empty($data['ic_icon_image'])) {
		$detail_key['dif_icon_file'] = $data['ic_icon_image'];
		$detail_key['dif_text'] = $data['ic_icon_text'];
	}
	$tabledif->insertRow($detail_key); 
	unset($data['ic_icon_image']);
	unset($detail_key2['dif_icon_file']);

	Location(BASE_URL . $XFA['detail']."/di_id/".$did); 		
}

$key2 = $fwRequest->getParam('key2', '');

if(!empty($key2))
{
	
	
	$did = $fwRequest->getParam('did', '');
	
	foreach($key2 as $kk => $vk)
	{
		
		$detail_key2['dif_key_feature'] = $vk;
		
		$sql_1 = "Select ic_icon_image, ic_icon_text  from icon_list where ic_icon_name = '".$vk ."'";	
		$data  = $fwDb -> queryOne($sql_1);
		
		
		if(!empty($data['ic_icon_image'])) {
			$detail_key2['dif_icon_file'] = $data['ic_icon_image'];
			$detail_key2['dif_text'] = $data['ic_icon_text'];
		    }
		
		$tabledif->setWhere("dif_id = $kk");
		$id = $tabledif->updateRow($detail_key2);
		unset($data['ic_icon_image']);
		unset($detail_key2['dif_icon_file']);
	}
	
	Location(BASE_URL . $XFA['detail']."/di_id/".$did); 		
}

$bfpl_plan = $fwRequest->getParam('bfpl_plan', '');



if(!empty($bfpl_plan))
{
	
	
	$did_bf = $fwRequest->getParam('did_bf', '');
	$detail_bfpl['dib_di_id'] = $did_bf;
	$detail_bfpl['dib_legend'] = $bfpl;
	
	$sql_1 = "Select ic_icon_image, ic_icon_text from icon_list where ic_icon_name = '".$plan ."'";	
	$data  = $fwDb -> queryOne($sql_1);
	
	if(!empty($data['ic_icon_image'])) {
		$detail_bfpl['dib_icon'] = $data['ic_icon_image'];
		//$detail_bfpl['dif_text'] = $data['ic_icon_text'];
	}
	$tablebfpl->insertRow($detail_bfpl); 
	unset($data['ic_icon_image']);
	unset($detail_bfpl['dib_icon']);

	Location(BASE_URL . $XFA['detail']."/di_id/".$did_bf); 		
}



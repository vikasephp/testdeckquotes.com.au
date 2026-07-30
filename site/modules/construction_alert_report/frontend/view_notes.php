<?php
$fwMainView = 'file:' . getcwd() . '/view_notes.tpl';
$car_id = (int)$fwRequest->getParam('car_id', 0);


$ord =  " ORDER BY if(  car_notes.cn_date = ' '
         OR car_notes.cn_date IS NULL , 1, 0 ) , STR_TO_DATE( car_notes.cn_date, '%d-%m-%Y' ) DESC";
		 
$ord2 =  " ORDER BY if(  car_supplier_update.cu_date = ' '
         OR car_supplier_update.cu_date IS NULL , 1, 0 ) ,  car_supplier_update.cu_date DESC";		 

$sql = "Select * from car_notes where cn_car_id = ".$car_id .' '.$ord;
$data = $fwDb->query($sql);

$sql2 = "Select count(*) as tot from car_notes where cn_car_id = ".$car_id;
$data2 = $fwDb->queryOne($sql2);


$sql_2 = "Select cu_supplier_name, cu_update_text,cu_attachment, cu_attachment_2,  cu_attachment_3,   cu_attachment_4,  cu_attachment_5,
		  cu_date,cu_alert_resolved 	 from car_supplier_update where  cu_car_id = ".$car_id. $ord2;
$suData = $fwDb->query($sql_2);


$sql3 = "Select count(*) as tot from car_supplier_update where cu_car_id = ".$car_id;
$data3 = $fwDb->queryOne($sql3);

foreach($suData as $k=>$v)
{
     $suData[$k]['cu_date']= changedate_d_m_y($v['cu_date']);
}



  $sql_nt = "Select max(STR_TO_DATE(cn_date, '%d-%m-%Y' )) as notes_date from car_notes where cn_car_id = ".$car_id;
  $ntdata = $fwDb->queryOne($sql_nt);
  	 

  $sql_nt2 = "Select max(cu_date) as notes_date2 from car_supplier_update where cu_car_id = ".$car_id; 
  $ntdata2 = $fwDb->queryOne($sql_nt2);
  
   
  if(strtotime($ntdata['notes_date']) > strtotime($ntdata2['notes_date2']))
     {
		  $fwViewData['top'] = 1 ;
	 }
	 else {
		  $fwViewData['top'] = 2 ;
	 }


$fwViewData['car_id'] = $car_id;
$fwViewData['notesdata'] = $data; 
$fwViewData['total'] = $data2['tot'] + $data3['tot'];
$fwViewData['sudata'] = $suData;
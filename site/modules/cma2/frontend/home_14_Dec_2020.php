<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$searchaddr = $fwRequest->getParam('searchaddr', '');
$table = new Fw_Db_Table('cma2');
$where = "WHERE 1=1 ";
$fwViewData['ran'] =  rand(100000,999999);
	
$savedata = $fwRequest->getParam('savedata', '');	
$clear = $fwRequest->getParam('clear', '');

$searchkey = $fwRequest->getParam('searchkey', '');

if($savedata) { 

	$salution = $fwRequest->getParam('salution', '');

	foreach($salution as $ks=>$vs)
	{
		$salutionData['cma_bsn_id'] = $ks;
		$salutionData['cma_sal'] = $vs;
		$table->setWhere('cma_bsn_id = '.$ks);
		if(!$table->rowExists())
		{
			$table->insertRow($salutionData);
		}
		else {
			
			$detail = $table->updateRow($salutionData);	
		}
	}
	
	$bed = $fwRequest->getParam('bed', '');
	
	foreach($bed as $ks=>$vs)
	{
		$bedData['cma_bsn_id'] = $ks;
		$bedData['cma_bed'] = $vs;
		$table->setWhere('cma_bsn_id = '.$ks);
		if(!$table->rowExists())
		{
			$table->insertRow($bedData);
		}
		else {
			
			$detail = $table->updateRow($bedData);	
		}
	}
	
	
	$bath = $fwRequest->getParam('bath', '');
	
	foreach($bath as $kb=>$vb)
	{
		$bathData['cma_bsn_id'] = $kb;
		$bathData['cma_bath'] = $vb;
		$table->setWhere('cma_bsn_id = '.$kb);
		if(!$table->rowExists())
		{
			$table->insertRow($bathData);
		}
		else {
			
			$detail = $table->updateRow($bathData);	
		}
	}
	
	
	$block = $fwRequest->getParam('block', '');
	foreach($block as $kb=>$vb)
	{
		$blockData['cma_bsn_id'] = $kb;
		$blockData['cma_block'] = $vb;
		$table->setWhere('cma_bsn_id = '.$kb);
		if(!$table->rowExists())
		{
			$table->insertRow($blockData);
		}
		else {
			$detail = $table->updateRow($blockData);	
		}
	}
	
	$high_price = $fwRequest->getParam('high_price', '');
	foreach($high_price as $kb=>$vb)
	{
		$hpData['cma_bsn_id'] = $kb;
		$hpData['cma_high_price'] = $vb;
		$table->setWhere('cma_bsn_id = '.$kb);
		if(!$table->rowExists())
		{
			$table->insertRow($hpData);
		}
		else {
			$detail = $table->updateRow($hpData);	
		}
	}
	
	$mpg = $fwRequest->getParam('mpg', '');
	foreach($mpg as $kb=>$vb)
	{
		$mpgData['cma_bsn_id'] = $kb;
		$mpgData['cma_mpg'] = $vb;
		$table->setWhere('cma_bsn_id = '.$kb);
		if(!$table->rowExists())
		{
			$table->insertRow($mpgData);
		}
		else {
			$detail = $table->updateRow($mpgData);	
		}
	}
	
	
	$type = $fwRequest->getParam('type_of_report', '');
	
	foreach($type as $kt=>$vt)
	{
		$typeData['cma_bsn_id'] = $kt;
		$typeData['cma_type_of_report'] = $vt;
		$table->setWhere('cma_bsn_id = '.$kt);
		if(!$table->rowExists())
		{
			$table->insertRow($typeData);
		}
		else {
			
			$detail = $table->updateRow($typeData);	
		}
	}
	
		if($_FILES['salescma'])
		{
			
				foreach($_FILES['salescma']['name'] as $ks=>$vs)
				{

					if($vs)
					{
					
						$salescmaData['cma_bsn_id'] = $ks;
						
						$doc1 = $vs;
						$file_type = $_FILES['salescma']['type'][$ks];	
						
										
						$datetime = trim(date('d_m_Y_H_i_'),'0');
						$doc1 = preg_replace('/[^A-Z0-9._]/i', '_', $doc1);
						$src =  $_FILES['salescma']['tmp_name'][$ks]; 
						$destination = BASE_DIR.'files/cma/'.$doc1;
					
						if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					   else
							{
								$salescmaData['cma_sales_cma'] = $doc1;
								chmod($destination, 0664);
							}
							
							$table->setWhere('cma_bsn_id = '.$ks);
							if(!$table->rowExists())
							{
								$table->insertRow($salescmaData);
							}
							else {
								$detail = $table->updateRow($salescmaData);	
							}		
					}
					
				}
					
		}
		
		if($_FILES['brochure'])
		{
			
				foreach($_FILES['brochure']['name'] as $kb=>$vb)
				{

					if($vb)
					{
					
						$salescmaData['cma_bsn_id'] = $kb;
						
						$doc1 = $vb;
						$file_type = $_FILES['brochure']['type'][$kb];	
						
										
						$datetime = trim(date('d_m_Y_H_i_'),'0');
						$doc1 = preg_replace('/[^A-Z0-9._]/i', '_', $doc1);
						$src =  $_FILES['brochure']['tmp_name'][$kb]; 
						$destination = BASE_DIR.'files/cma/'.$doc1;
					
						if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					   else
							{
								$brochureData['cma_brochure'] = $doc1;
								chmod($destination, 0664);
							}
							
							$table->setWhere('cma_bsn_id = '.$kb);
							if(!$table->rowExists())
							{
								$table->insertRow($brochureData);
							}
							else {
								$detail = $table->updateRow($brochureData);	
							}		
					}
					
				}
					
		}
	
	
	if($_FILES['merged'])
		{
			
				foreach($_FILES['merged']['name'] as $km=>$vm)
				{

					if($vm)
					{
					
						$salescmaData['cma_bsn_id'] = $km;
						
						$doc1 = $vm;
						$file_type = $_FILES['merged']['type'][$km];	
						
										
						$datetime = trim(date('d_m_Y_H_i_'),'0');
						$doc1 = preg_replace('/[^A-Z0-9._]/i', '_', $doc1);
						$src =  $_FILES['merged']['tmp_name'][$km]; 
						$destination = BASE_DIR.'files/cma/'.$doc1;
					
						if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					   else
							{
								$mergedData['cma_merged'] = $doc1;
								chmod($destination, 0664);
							}
							
							$table->setWhere('cma_bsn_id = '.$km);
							if(!$table->rowExists())
							{
								$table->insertRow($mergedData);
							}
							else {
								$detail = $table->updateRow($mergedData);	
							}		
					}
					
				}
					
		}
	
	
}	
	
	
if($keyword):
$where .= "AND business.bsn_sub_status LIKE '%".$keyword."%'";
	
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

	$where .= "AND business.bsn_sub_status LIKE '%".$_SESSION['keyword']."%'";
	
	$fwViewData['keyword']=$_SESSION['keyword'];
endif;
  
  if($searchkey):

		$where .= " AND business.bsn_address LIKE '%".$searchkey."%'";
			
			$_SESSION['searchkey'] = $searchkey;
			$fwViewData['searchkey']=$_SESSION['searchkey'];
		
		elseif($_SESSION['searchkey'] && $pagenum > 0):
		
			$where .= " AND business.bsn_address LIKE '%".$_SESSION['searchkey']."%'";
			
		$fwViewData['searchkey']=$_SESSION['searchkey'];
endif;
   
  if($clear)
  {
	unset($_SESSION['searchkey']);
	$_SESSION['searchkey']='';
	$searchkey='';
	$fwViewData['searchkey']='';
	$where = "WHERE 1=1 ";
 }
 

   
   
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
		



$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
	bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2,bus_customers.bcust_misc_moble,bus_customers.bcust_misc_business,
	bus_customers.bcust_misc_home,business.bsn_advert_text,  business.bsn_id, business.bsn_name,  business.bsn_sub_status,
	business.bsn_address, cma2.cma_bsn_id, cma2.cma_sal, cma2.cma_bed, cma2.cma_bath, cma2.cma_block, cma_high_price, cma_low_price,
	cma2.cma_mpg , cma2.cma_sales_cma,cma2.cma_brochure, cma2.cma_merged, cma2.cma_type_of_report
	from business_sellers 		
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id  
	Left Join cma2 ON business_sellers.bs_business_id = cma2.cma_bsn_id
	". $where. " And business.bsn_sub_status IN ('Open','Hold') Order By business.bsn_status_sys_date DESC";

if($sql){$userData = $fwDb->query($sql);}


$fwViewData['total2'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 300;
    $last = ceil($rows/$page_rows); 

    if ($pagenum <= 1)
    {
        $pagenum = 1;
    }
    elseif ($pagenum > $last)
    {
        $pagenum = $last;
    }
	$numstartvounter =  $page_rows * ($pagenum-1) + 1;
	$fwViewData['numstartvounter'] = $numstartvounter;
		
    $fwViewData['last'] = $last;
    $fwViewData['lastone'] = $last-1;
	$fwViewData['lasttow'] = $last-2;
    $fwViewData['pagenum'] = $pagenum;
	$pagenatedatanext = $pagenum;
	$pagenatedataprev = $pagenum;
	for($i=0; $i<9; $i++)
		{
		$paginate[$pagenatedatanext] = $pagenatedatanext;
		$pagenatedatanext ++;
		}
		$fwViewData['paginatenext'] = $paginate;
	$pagenatedataprev = $pagenum;	
	for($i=0; $i<9; $i++)
		{
		$paginateprev[$pagenatedataprev] = $pagenatedataprev;
		$pagenatedataprev --;
		}
	$fwViewData['paginateprev'] = array_reverse($paginateprev);
	
    $max = 'limit ' .($pagenum - 1) * $page_rows .',' .$page_rows;
    
    $sql2 =  $sql." ".$max;

if($sql2)
{  

 $setdata = $fwDb->query($sql2);
 $fwViewData['list'] =  $setdata;
  
  //db($fwViewData['list']);
  //exit;
 //foreach ($setdata2 as $key => $row) {
//    // replace 0 with the field's index/key
//    $dates[$key]  = $row['dayscount'];
//}
//	array_multisort($dates, SORT_ASC, $setdata2);

 	
 	
 }
}
	

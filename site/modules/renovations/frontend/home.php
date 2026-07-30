<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$renoTable = new Fw_Db_Table($TABLE);

// Save Last Audited
$lastau = $fwRequest->getParam('lastaudited', '');
if(!empty($lastau)) {
	$ladata = $fwRequest->getParam('lastaudited', '');
	
	foreach($ladata as $kp2=>$vp2)
	{
		$laDetail['re_last_audited'] = $vp2;
		$laDetail['re_audied_user'] = $_SESSION['user']['user_name'];
	
		$renoTable->setWhere('re_id = '.$kp2);
		$detail = $renoTable->updateRow($laDetail);		
	}
}
//End Last Audited

$up = $fwRequest -> getParam('up',0);
$down = $fwRequest -> getParam('down',0);

if($down || $up)
  {
    $minmaxsql = "SELECT MAX(re_order) as maxord, MIN(re_order) as minord FROM ".$TABLE;
    $minmaxdata = $fwDb->queryOne($minmaxsql);
    $allroderssql = "SELECT re_order FROM ".$TABLE." ORDER BY re_order ASC";
    $allroderdata = $fwDb->query($allroderssql);	
    
    if($up)
	{
		
		if($up > $minmaxdata['minord'])
			{
				foreach($allroderdata as $k => $v)
				{
					if($up == $v['re_order'])
					{
						$updateord = $allroderdata[$k-1]['re_order'];
					}
				}
		
				$data['re_order'] = $updateord;
				$data2['re_order'] = (int)$up;
				$renoTable->setWhere("re_order = ".$up);	
				$ldata = $renoTable->getRow(); 
				$renoTable->setWhere("re_order = ".$updateord);
				$ndata = $renoTable->getRow(); 
				$renoTable->setWhere("re_id = ".$ldata['re_id']);
				$renoTable->updateRow($data);
				$renoTable->setWhere("re_id = ".$ndata['re_id']);
				$renoTable->updateRow($data2);	
			}		
	}
    
    
     if($down)
	{
		
		if($down < $minmaxdata['maxord'])
			{
				foreach($allroderdata as $k => $v)
				{
					if($down== $v['re_order'])
					{
						$updateord = $allroderdata[$k+1]['re_order'];
					}
				}
		
				$data['re_order'] = $updateord;
				$data2['re_order'] = (int)$down;
				$renoTable->setWhere("re_order = ".$down);	
				$ldata = $renoTable->getRow(); 
				$renoTable->setWhere("re_order = ".$updateord);
				$ndata = $renoTable->getRow(); 
				$renoTable->setWhere("re_id = ".$ldata['re_id']);
				$renoTable->updateRow($data);
				$renoTable->setWhere("re_id = ".$ndata['re_id']);
				$renoTable->updateRow($data2);	
			}		
	}
    
    
    
  }


$onwebsite = $fwRequest->getParam('onwebsite', '');
if($onwebsite)
{
	 foreach($onwebsite as $k=>$v)
	 {
		  $id = $k; 
	 }
	
	  $detail['re_on_website'] = $v;
	  $renoTable->setWhere("re_id = ".$id);
	  if($renoTable->rowExists())
	  {
		 $this_id = $renoTable->updateRow($detail);
	  }
}
$where = "WHERE 1=1 ";
  
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where." ORDER BY ".$TABLE.". re_order ASC";	

if($matsql){$userData = $fwDb->query($matsql);}


if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
    $rows = count($userData);
    $page_rows = 100;
    $last = ceil($rows/$page_rows);    
    if ($pagenum <= 1)
    {
        $pagenum = 1;
    }
    elseif ($pagenum > $last)
    {
        $pagenum = $last;
    }
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
    
    $sql2 =  $matsql." ".$max;
    if($sql2){$lists= $fwDb->query($sql2);

	foreach($lists as $list):

		$listsnew[] = $list;
	endforeach;
	
	$fwViewData['list'] = $listsnew;
  }
}

$fwViewData['title'] = $MODULE_PLURAL;


// Export to Excel

$export = $fwRequest->getParam('export', 0);

if($export > 0)
	{

	$sqlexport = "Select renovations.* from renovations";
        if($sqlexport){$exportData = $fwDb->query($sqlexport);}
		
require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";
//require BASE_DIR . "PHPExcel/Classes/PHPExcel/Writer/Excel2007.php";

$objPHPExcel = new PHPExcel();

$objPHPExcel->getProperties()->setCreator("Deckquotes")
							 ->setLastModifiedBy("Nick C")
							 ->setTitle("Office 2007 XLSX Test Document")
							 ->setSubject("Office 2007 XLSX Test Document")
							 ->setDescription("Renovations exported to Office 2007 XLSX.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Street sign file");

//$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(50);
$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
	
// Add some data
$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A1', 'SrNo')
            ->setCellValue('B1', 'Title')
	    ->setCellValue('C1', 'On Website')
	  ;

$from = "A1"; // or any value
$to = "D1"; // or any value
$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold( true );

$row=2;
$sr=1;
foreach($exportData as $k=>$v)
{

	$objPHPExcel->getActiveSheet()
		    ->setCellValue('A'.$row, $sr)
		    ->setCellValue('B'.$row, $v['re_title'])
		    ->setCellValue('C'.$row, $v['re_on_website'])
                                ;	
	$row= $row+1;			
	$sr=$sr+1;
}

$objPHPExcel->getActiveSheet()->setTitle('Renovations');


$objPHPExcel->setActiveSheetIndex(0);

header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="renovations.xls"');
header('Cache-Control: max-age=0');
header('Cache-Control: max-age=1');
header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header ('Pragma: public'); // HTTP/1.0

$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
$objWriter->save('php://output');
exit;

	}
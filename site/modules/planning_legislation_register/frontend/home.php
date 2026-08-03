<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);

$table = new Fw_Db_Table('planning_legislation_register');
$where = " where 1 = 1 ";

$sqlA = "select * from planning_legislation_register";
$data = $fwDb->query($sqlA);


foreach($data as $k=>$v)
{

	$sql = "select pd_hierarchy from planning_legislation_doctype where pd_id = ".$v['plr_doc_type'];
	$data = $fwDb->queryOne($sql);
	
	$sqlB = "update planning_legislation_register set plr_hierarchy = ".$data['pd_hierarchy']. " Where plr_id = ".$v['plr_id'];
	$fwDb->queryOne($sqlB);
	
	
}


$type = $fwRequest->getParam('type', '');
if($type)
{
	 $keys_2 = array_keys($type);
	 $ky_2 = $keys_2[0];
	 $val_2 = $type[$ky_2];
	
	$val = explode("|",$val_2);
	$value1 = $val[0];
	$value2 = $val[1];

	
	  $detail['plr_doc_type'] = $value1;
	  $detail['plr_hierarchy'] = $value2;
	  $table->setWhere("plr_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}


$clear = $fwRequest->getParam('clear', '');
if (!empty($clear)) {
	
	unset($_SESSION['im_type']);
	$fwViewData['im_type']= '';

}


//$matsql = "SELECT $TABLE.* FROM $TABLE  " .$where . " ORDER BY
//    CASE
//        WHEN plr_hierarchy = 0 THEN 1
//        ELSE 0
//    END,
//    plr_hierarchy ASC,
//	plr_doc_type DESC";
//	
	
	
$matsql = "SELECT t.*, pld.pd_doc_type
			FROM $TABLE AS t
			left JOIN planning_legislation_doctype AS pld
				ON t.plr_doc_type = pld.pd_id
			$where
			ORDER BY
				CASE
					WHEN t.plr_hierarchy = 0 THEN 1
					ELSE 0
				END,
				t.plr_hierarchy ASC,pld.pd_doc_type ASC,
				t.plr_doc_type DESC";	
	


$resultData = $fwDb->query($matsql);

if (!empty($resultData)) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	}
	$rows = count($resultData);
	$page_rows = 300;
	$last = ceil($rows / $page_rows);
	if ($pagenum <= 1) {
		$pagenum = 1;
	} elseif ($pagenum > $last) {
		$pagenum = $last;
	}
	$fwViewData['last'] = $last;
	$fwViewData['lastone'] = $last - 1;
	$fwViewData['lasttow'] = $last - 2;
	$fwViewData['pagenum'] = $pagenum;
	$pagenatedatanext = $pagenum;
	$pagenatedataprev = $pagenum;
	for ($i = 0; $i < 9; $i++) {
		$paginate[$pagenatedatanext] = $pagenatedatanext;
		$pagenatedatanext++;
	}
	$fwViewData['paginatenext'] = $paginate;
	$pagenatedataprev = $pagenum;
	for ($i = 0; $i < 9; $i++) {
		$paginateprev[$pagenatedataprev] = $pagenatedataprev;
		$pagenatedataprev--;
	}
	$fwViewData['paginateprev'] = array_reverse($paginateprev);

	$max = 'limit ' . ($pagenum - 1) * $page_rows . ',' . $page_rows;

	$sql2 =  $matsql . " " . $max;
	if ($sql2) {
		$lists = $fwDb->query($sql2);

		foreach ($lists as $list):
			$list['link'] =  $BASE_URL . "business.detail/bsn_id/" . $list['va_bsn_id'];			
			$listsnew[] = $list;
		endforeach;

		$fwViewData['list'] = $listsnew;
		//echo "<pre>"; print_r($lists); exit();
	}
}


$fwViewData['list'] = $listsnew;	


$sqlT = "select * from  planning_legislation_doctype where pd_active = 1";
$fwViewData['typedata'] = $fwDb->query($sqlT);

$fwViewData['title'] = $MODULE_PLURAL;

//Convert PDf to HTML File
if (isset($_POST['convert_pdf'])) {

    if (isset($_FILES['pdf_file']) && $_FILES['pdf_file']['error'] == UPLOAD_ERR_OK) {

        $file = $_FILES['pdf_file'];
        $pdfPath = $file['tmp_name'];

        $originalName = pathinfo($file['name'], PATHINFO_FILENAME);
        $htmlFileName = $originalName . '.html';

        $outputDir = sys_get_temp_dir() . '/pdf_html_' . uniqid();
        mkdir($outputDir, 0755, true);

        $htmlFile = $outputDir . '/' . $htmlFileName;

        $command = sprintf(
            '/usr/bin/pdftohtml -s -noframes %s %s 2>&1',
            escapeshellarg($pdfPath),
            escapeshellarg($htmlFile)
        );

        $output = shell_exec($command);

        if (!file_exists($htmlFile)) {

            echo "<script>alert('PDF conversion failed. Please try again.');</script>";
            exit;
        }

        $htmlContent = file_get_contents($htmlFile);

        $htmlContent = str_replace(
            'bgcolor="#A0A0A0"',
            '',
            $htmlContent
        );

        file_put_contents($htmlFile, $htmlContent);

        header('Content-Type: text/html');
        header('Content-Disposition: attachment; filename="' . $htmlFileName . '"');
        header('Content-Length: ' . filesize($htmlFile));

        readfile($htmlFile);

        if (is_dir($outputDir)) {
            $files = glob($outputDir . '/*');
            foreach ($files as $file) {
                if (is_file($file)) {
                    unlink($file);
                }
            }

            rmdir($outputDir);
        }
        exit;

    } else {

        echo "<script>alert('Please select a PDF file.');</script>";
        exit;
    }
}

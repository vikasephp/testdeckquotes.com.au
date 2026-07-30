<?php
$pagenum = $fwRequest->getparam('pagenum', '');
$tablePages = new Fw_Db_Table($TABLE);
$export = $fwRequest->getParam('export', 0);
$short = $fwRequest->getParam('s', '');

$listdata = $fwRequest->getParam($TABLE, array());

$keyword = $listdata['keyword'];
$where = "WHERE 1=1 ";

$fwViewData['ran'] =  rand(100000, 999999);

$search_type = $fwRequest->getParam('search_type', []);
if(!empty($search_type)) {
    $pm_type_id = array_keys($search_type)[0];
    $where = ' WHERE pm_type_id = ' . $pm_type_id;
}


$openclose = $fwRequest->getParam('openclose', '');
if (!empty($openclose)) {
    $where = " WHERE pm_open_position = 1";
}

$reset = $fwRequest->getParam('reset', '');
if (!empty($submit)) {
    $where = " WHERE 1 = 1";
}

$query = 'SELECT * FROM `position_matrix_type`';
$result = $fwDb->query($query);
$position_matrix_type = [];
foreach($result as $row) {
    $row['pmt_name'] = ucfirst($row['pmt_name']);
    $position_matrix_type[] = $row;
}
$fwViewData['position_matrix_type'] = $position_matrix_type;

//if($keyword) {
//$_SESSION['keyword'] = $keyword;
//$fwViewData['keyword']=$_SESSION['keyword'];
//}
//else { unset($_SESSION['keyword']); }

//if($keyword):
//$where .= "AND ".$TABLE.".re_position LIKE '%".$keyword."%'";

//	$_SESSION['keyword'] = $keyword;
//	$fwViewData['keyword']=$_SESSION['keyword'];

//elseif($_SESSION['keyword'] && $pagenum > 0):

//$where .= "AND ".$TABLE.".re_position LIKE '%".$keyword."%'";

//	$fwViewData['keyword']=$_SESSION['keyword'];
//endif;

$sql = "SELECT $TABLE.*, positions.p_name, positions.p_id, positions.p_name_explained FROM $TABLE INNER JOIN positions ON $TABLE.pm_position = positions.p_id $where";



if ($sql) {
    $userData = $fwDb->query($sql);
}

if (!empty($userData)) {
    if (!(isset($pagenum))) {
        $pagenum = 1;
    }

    $rows = count($userData);

    $page_rows = 100;
    $last = ceil($rows / $page_rows);

    if ($pagenum <= 1) {
        $pagenum = 1;
    } elseif ($pagenum > $last) {
        $pagenum = $last;
    }
    $numstartvounter =  $page_rows * ($pagenum - 1) + 1;
    $fwViewData['numstartvounter'] = $numstartvounter;

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

    $sql2 =  $sql . " " . $max;

    if ($sql2) {

        $setdata = $fwDb->query($sql2);
        $fwViewData['list'] =  $setdata;
    }
}

$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Position Matrix";

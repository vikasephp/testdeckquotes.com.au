<?php
$fwMainView = 'file:' . getcwd() . '/colorbox.tpl';

$this_table = new Fw_Db_Table($TABLE);

$data['ldd_traffic_color_updated_by'] = $_SESSION['user']['user_name'];
$data['ldd_traffic_color_updated_date'] = date("d-m-Y");

$green = $fwRequest->getParam('green', '');
$orange = $fwRequest->getParam('orange', '');
$red = $fwRequest->getParam('red', '');
$yellow = $fwRequest->getParam('yellow', '');

$this_id = $fwRequest->getParam($ID, 0);
$fwViewData['this_id']= $this_id;

//$submit = $fwRequest->getParam('submit', '');

if($this_id > 0 && $green) {
	$this_table->setWhere($ID . ' = ' . $this_id);
	if($this_table->rowExists()) {
		$data['ldd_traffic_color'] = 'green';
		$detail = $this_table->updateRow($data);
	}	
	$fwViewData['opr'] = "Close";	
}

if($this_id > 0 && $orange) {
	$this_table->setWhere($ID . ' = ' . $this_id);
	if($this_table->rowExists()) {
		$data['ldd_traffic_color'] = 'orange';
		$detail = $this_table->updateRow($data);
	}	
	$fwViewData['opr'] = "Close";	
}

if($this_id > 0 && $red) {
	$this_table->setWhere($ID . ' = ' . $this_id);
	if($this_table->rowExists()) {
		$data['ldd_traffic_color'] = 'red';
		$detail = $this_table->updateRow($data);
	}	
	$fwViewData['opr'] = "Close";	
}

if($this_id > 0 && $yellow) {
	$this_table->setWhere($ID . ' = ' . $this_id);
	if($this_table->rowExists()) {
		$data['ldd_traffic_color'] = 'yellow';
		$detail = $this_table->updateRow($data);
	}	
	$fwViewData['opr'] = "Close";	
}


$sql = "SELECT ldd_traffic_color FROM $TABLE WHERE $ID = $this_id";
$result = $fwDb->queryOne($sql);

$fwViewData['ldd_traffic_color'] = $result['ldd_traffic_color'];

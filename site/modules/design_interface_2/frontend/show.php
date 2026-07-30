<?php
$fwMainView = 'file:' . getcwd() . '/show.tpl';
$this_id = $fwRequest->getParam('dd_id', '');
$tableDesign = new Fw_Db_Table('design_interface_designs');
$tableDesign->setWhere("dd_id = $this_id");
$fwViewData['design_img'] =$tableDesign->getRow();
//db($fwViewData['design_img']);

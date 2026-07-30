<?php
$fwMainView = 'file:' . getcwd() . '/calcadd.tpl';
$req = $fwRequest->getParam('req', '');
$tablebusinessseller = new Fw_Db_Table('bus_decking_calc');
$bsn_id = $fwRequest->getParam('bsn_id', 0);
$bdc_id = $fwRequest->getParam('bdc_id', 0);

if($req == "show" && $bsn_id > 0){
$tablebusinessseller->setWhere("bdc_bsn_id = ".$bsn_id);
$fwViewData['calclist'] = $tablebusinessseller->getRows();

}elseif($req == "delete" && $bdc_id > 0){
$tablebusinessseller->setWhere("bdc_id = ".$bdc_id);
$tablebusinessseller->deleteRow();
echo "Del";
exit;
}else{
$bdc_ptsqm = $fwRequest->getparam('bdc_ptsqm', ''); 
$decking_alltotals = $fwRequest->getparam('decking_alltotals', ''); 
$cd_type_id = $fwRequest->getparam('cd_type_id', ''); 
$data['bdc_ptype'] = $cd_type_id;

$data['bdc_bsn_id'] = $bsn_id;
$data['bdc_ptsqm'] = $bdc_ptsqm;
$data['bdc_subtotal'] = $decking_alltotals;
if($decking_alltotals > 0){
$tablebusinessseller->setWhere("bdc_ptsqm = ".$bdc_ptsqm);

if($tablebusinessseller->rowExists()){
$tablebusinessseller->setWhere("bdc_ptsqm = ".$bdc_ptsqm);
$this_id = $tablebusinessseller->updateRow($data);
}else{ $this_id = $tablebusinessseller->insertRow($data);}
echo $this_id;
exit;
}
}
<?php

$fwViewData['title'] = $MODULE_PLURAL;

$query = 'SELECT * FROM item_list IL LEFT JOIN item_categories IC ON IC.ic_id = IL.il_ic_id ORDER BY IC.ic_name ASC, IL.il_name ASC';
$result = $fwDb->query($query);
$fwViewData['list'] = $result;

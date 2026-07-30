<?php

$weekDay = date('D');
$hour = date('H');
db($weekDay);
db($hour);
if($weekDay == 'Wed' && $hour == 23) {
    // db('true');
    $query = 'UPDATE inclusions_task_tracker_choices_7_day SET last_week = this_week';
    $fwDb->queryOne($query);
}
else {
    db('false');
}

exit;
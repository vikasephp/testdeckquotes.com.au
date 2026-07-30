<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<style>
    .table-calendar {
        margin-top: 35px;
    }
    .table-calendar, .table-calendar tr, .table-calendar tr th, .table-calendar tr td {
        border-collapse: collapse;
    }
    .table-calendar td {
        height: 100px;
        width: 150px;
    }
    .table-calendar .day-cell {
        position: relative;
    }
    .table-calendar .empty-cell {
        background: #dedede;
    }
    .table-calendar .day {
        position: absolute;
        bottom: 1px;
        right: 1px;
        color: silver;
    }
    .booked {
        background: rgb(237, 170, 2);
    }
</style>
<div align="center" style="min-height:350px; z-index:9999999;">
	<!-- <h3 class="page-title" style="margin: 30px 0;">{{ $MODULE_PLURAL }}</h3> -->
    {{$calendar}}
</div>
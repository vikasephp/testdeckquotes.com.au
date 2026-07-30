<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<style type="text/css">
    p,
    body,
    td,
    input,
    select,
    button {
        font-family: -apple-system, system-ui, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
        font-size: 14px;
    }

    body {
        padding: 0px;
        margin: 0px;
        background-color: #ffffff;
    }

    a {
        color: #1155a3;
    }

    .space {
        margin: 10px 0px 10px 0px;
    }

    .header {
        background: #003267;
        background: linear-gradient(to right, #011329 0%, #00639e 44%, #011329 100%);
        padding: 5px 10px;
        color: white;
        box-shadow: 0px 0px 10px 5px rgba(0, 0, 0, 0.75);
    }

    .header a {
        color: white;
    }

    .header h1 a {
        text-decoration: none;
    }

    .header h1 {
        padding: 0px;
        margin: 0px;
        font-size: 20px;
    }

    .main {
        padding: 10px;
        margin-top: 10px;
        height: 90%;
    }
</style>
<style>
    .buttons {
        margin-bottom: 10px;
        /*margin-top: 20px;*/
        display: inline-flex;
    }

    .buttons button {
        background-color: #f3f3f3;
        color: #333333;
        border: 1px solid #cccccc;
        padding: .5rem 1rem;
        width: 80px;
        font-size: 14px;
        cursor: pointer;
        margin-right: 1px;
        transition: all 0.2s;
        box-sizing: border-box;
    }

    .buttons button.selected {
        background-color: #e5e5e5;
        border-color: #cccccc;
    }

    .buttons button:first-child {
        border-top-left-radius: 30px;
        border-bottom-left-radius: 30px;
    }

    .buttons button:last-child {
        border-top-right-radius: 30px;
        border-bottom-right-radius: 30px;
    }

    .buttons button:hover {
        background-color: #ffe794dd;
        border-color: #ffce18;
    }

    .buttons button:active {
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    /* context menu icons */
    .icon:before {
        position: absolute;
        margin-left: 0px;
        margin-top: 3px;
        width: 14px;
        height: 14px;
        content: '';
    }

    .icon-blue:before {
        background-color: #3d85c6;
    }

    .icon-green:before {
        background-color: #6aa84f;
    }

    .icon-orange:before {
        background-color: #e69138;
    }

    .icon-red:before {
        background-color: #cc4125;
    }

    body .calendar_default_event_inner {
        border-radius: 10px;
    }

    body .month_default_event_inner {
        border-radius: 10px;
    }
</style>
<style>
    .alert-table {
        width: 100%;
        margin-top: 15px;
    }
    .alert-table, .alert-table tr, .alert-table th, .alert-table td {
        border: 1px solid #ddd;
        border-collapse: collapse;
    }
    .alert-table th, .alert-table td {
        text-align: left;
        padding: 4px 6px;
        font-size: 15px;
        vertical-align: middle;
    }
    .tools {
        background-color: #f9f9f9;
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0,0,0,.1);
        flex-wrap: wrap;
        justify-content: start;
        margin: 20px 0;
        padding: 10px 20px;
        align-items: center;
        display: flex;
    }
    .tools input[type="text"] {
        border: 1px solid #e0e0e0;
        border-radius: 15px;
        margin: 0 10px;
        outline: none;
        padding: 5px 10px;
        transition: border-color .3s;
    }
    .tools a, .tools button {
        background-color: #e0e0e0;
        border: none;
        border-radius: 15px;
        color: #333;
        cursor: pointer;
        margin: 0 10px;
        outline: none;
        padding: 5px 15px;
        text-decoration: none;
        transition: all .3s;
    }
</style>
<script src="{{$BASE_URL}}js/daypilot/daypilot-all.min.js"></script>

<div class="header">
    <h1>Calendar</h1>
    <!-- <div><a href="https://javascript.daypilot.org/">DayPilot for JavaScript</a> - HTML5 Calendar/Scheduling Components
        for JavaScript/Angular/React/Vue</div> -->
</div>

<div class="main">
    <div style="display:flex">
        <div style="">
            <div id="nav"></div>
        </div>
        <div style="flex-grow: 1; margin-left: 10px;">
            <!-- <div class="tools">
                Filter: <input id="filter" type="text"> <a href="#" id="clear">Clear</a>
            </div> -->
            <div class="toolbar buttons">
                <button id="buttonDay">Day</button>
                <button id="buttonWeek">Week</button>
                <button id="buttonMonth">Month</button>
            </div>
            <div id="dpDay"></div>
            <div id="dpWeek"></div>
            <div id="dpMonth"></div>
        </div>
    </div>
</div>

<script type="text/javascript">

    const nav = new DayPilot.Navigator("nav", {
        showMonths: 2,
        skipMonths: 2,
    });
    nav.init();

    const day = new DayPilot.Calendar("dpDay", {
        viewType: "Day",
        cellHeight: 60

    });
    configureCalendar(day);
    day.init();

    const week = new DayPilot.Calendar("dpWeek", {
        viewType: "Week",
        cellHeight: 60
    });
    configureCalendar(week);
    week.init();

    const month = new DayPilot.Month("dpMonth", {
        eventHeight: 32,
    });
    configureCalendar(month);
    month.init();

    
    function configureCalendar(calendar) {
        // calendar.elements = {
        //     filter: document.querySelector("#filter"),
        //     clear: document.querySelector("#clear"),
        // };
        // calendar.addEventHandlers() = {
        //     calendar.elements.filter.addEventListener("keyup", function() {
        //         const query = this.value;
        //         calendar.events.filter(query); // see onEventFilter above
        //     });

        //     calendar.elements.clear.addEventListener("click", function(ev) {
        //         ev.preventDefault();
        //         app.elements.filter.value = "";
        //         calendar.events.filter(null);
        //     });
        // };

        // calendar.heightSpec = 'Full';
        calendar.timeHeaderCellDuration = 60;
        calendar.cellDuration = 60;
        // calendar.businessBeginsHour = 12;
        // calendar.businessEndsHour = 18;
        // calendar.cellHeight = 60,
        calendar.visible = false;

        calendar.onEventFilter = args => {
            if (args.e.text().toUpperCase().indexOf(args.filter.toUpperCase()) === -1) {
                args.visible = false;
            }
        };

        // calendar.contextMenu = new DayPilot.Menu({
        //     items: [
        //         // {
        //         //     text: "Delete",
        //         //     onClick: async args => {
        //         //         var params = {
        //         //             id: args.source.id(),
        //         //         };
        //         //         await DayPilot.Http.post("calendar_delete.php", params);
        //         //         calendar.events.remove(params.id);
        //         //         console.log("Deleted");
        //         //     }
        //         // },
        //         // {
        //         //     text: "-"
        //         // },
        //         {
        //             text: "Blue",
        //             icon: "icon icon-blue",
        //             color: "#3d85c6",
        //             onClick: args => { updateColor(args.source, args.item.color); }
        //         },
        //         {
        //             text: "Green",
        //             icon: "icon icon-green",
        //             color: "#6aa84f",
        //             onClick: args => { updateColor(args.source, args.item.color); }
        //         },
        //         {
        //             text: "Orange",
        //             icon: "icon icon-orange",
        //             color: "#e69138",
        //             onClick: args => { updateColor(args.source, args.item.color); }
        //         },
        //         {
        //             text: "Red",
        //             icon: "icon icon-red",
        //             color: "#cc4125",
        //             onClick: args => { updateColor(args.source, args.item.color); }
        //         }
        //     ]
        // });


        calendar.onBeforeEventRender = args => {
            if (!args.data.backColor) {
                args.data.backColor = "#5794D0";
            }
            args.data.backColor += "c0";
            args.data.borderColor = "darker";
            args.data.fontColor = "#fff";
            args.data.barHidden = true;

            // args.data.areas = [
            //     {
            //         right: 4,
            //         top: 4,
            //         width: 24,
            //         height: 24,
            //         padding: 2,
            //         action: "ContextMenu",
            //         symbol: "{{$BASE_URL}}images/icons/daypilot.svg#hamburger-menu",
            //         backColor: args.data.backColor,
            //         fontColor: "#ffffff",
            //         style: "border-radius: 50%; border: 1px solid #ffffff"
            //     }
            // ];
        };

        calendar.onEventClicked = (args) => {
            // console.log(args.e);
            DayPilot.Modal.alert(args.e.data.note);
        };

        // calendar.onEventMoved = async args => {
        //     const params = {
        //         id: args.e.id(),
        //         newStart: args.newStart,
        //         newEnd: args.newEnd
        //     };
        //     await DayPilot.Http.post("calendar_move.php", params);
        //     console.log("Moved.");
        // };

        // calendar.onEventResized = async args => {
        //     const params = {
        //         id: args.e.id(),
        //         newStart: args.newStart,
        //         newEnd: args.newEnd
        //     };
        //     await DayPilot.Http.post("calendar_move.php", params);
        //     console.log("Resized.");
        // };

        // calendar.onTimeRangeSelected = async args => {

        //     const form = [
        //         { name: "Name", id: "text" },
        //         { name: "Start", id: "start", dateFormat: "MMMM d, yyyy h:mm tt", disabled: true },
        //         { name: "End", id: "end", dateFormat: "MMMM d, yyyy h:mm tt", disabled: true },
        //     ];

        //     const data = {
        //         start: args.start,
        //         end: args.end,
        //         text: "Event"
        //     };

        //     const active = switcher.active.control;

        //     const modal = await DayPilot.Modal.form(form, data);
        //     active.clearSelection();

        //     if (modal.canceled) {
        //         return;
        //     }

        //     const { data: result } = await DayPilot.Http.post("calendar_create.php", modal.result);

        //     active.events.add({
        //         start: modal.result.start,
        //         end: modal.result.end,
        //         id: result.id,
        //         text: modal.result.text
        //     });

        // };

        // calendar.onEventClick = args => {
        //     DayPilot.Modal.alert(args.e.data.text);
        // };
    }

    const switcher = new DayPilot.Switcher({
        triggers: [
            { id: "buttonDay", view: day },
            { id: "buttonWeek", view: week },
            { id: "buttonMonth", view: month }
        ],
        navigator: nav,
        selectedClass: "selected",
        onChanged: args => {
            switcher.events.load("{{$BASE_URL}}{{$BASEFOLDER}}.calendar_events");
        },
    });

    switcher.select("buttonDay");

    // async function updateColor(e, color) {
    //     const params = {
    //         id: e.data.id,
    //         color: color
    //     };

    //     // await DayPilot.Http.post("calendar_color.php", params);
    //     const calendar = switcher.active.control;
    //     e.data.backColor = color;
    //     calendar.events.update(e);
    //     console.log("Color updated");
    // }

    $(document).ready(function() {
        $("#filter").keyup(function() {
            var query = $(this).val();
            dp.events.filter(query); 
        });

        $("#clear").click(function() {
            $("#filter").val("");
            dp.events.filter(null);
            return false;
        });
    });

</script>
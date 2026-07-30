<div style="display: flex; justify-content: center; align-items: center; height: 100%; width: 100%;">
    <h1 style="font-size: 6rem; text-align: center;">
        <span id="live_date" onload="start_ticker()">{{ $datetime }}</span>
        <!-- <br>
        <span id="live_time">{{ $timezone }}</span> -->
    </h1>
</div>

<script>
    function formatTime(number) {
        return number < 10 ? '0' + number : number;
    }
    
    let now = new Date();
    let hours = formatTime(now.getHours());
    let minutes = formatTime(now.getMinutes());
    let seconds = formatTime(now.getSeconds());

    //document.getElementById('live_time').innerHTML = hours + ':' + minutes + ':' + seconds;

    function start_ticker(){
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                console.log(this.response);
                document.getElementById('live_date').innerHTML = this.response;
                setTimeout(start_ticker, 1000);
            }
        };
        xmlhttp.open("GET", "{{$BASE_URL}}server_time.ticker", true);
        xmlhttp.send();
    }

    start_ticker();
</script>


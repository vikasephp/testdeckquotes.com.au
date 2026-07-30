window.addEventListener("alert", (event) => {
    const type = event.detail[0].type;
    const message = event.detail[0].message;
    const title = event.detail[0].title ?? "";
    const options = {
        closeButton: true,
        debug: false,
        hideDuration: "5000",
        newestOnTop: true,
        progressBar: true,
        showDuration: "300",
        timeOut: "5000",
    };
    switch (type) {
        case "success":
            toastr.success(message, title ?? "", options);
            break;
        case "warning":
            toastr.warning(message, title ?? "", options);
            break;
        case "error":
            toastr.error(message, title ?? "", options);
            break;
        case "danger":
            toastr.error(message, title ?? "", options);
            break;
        case "info":
            toastr.info(message, title ?? "", options);
            break;
        default:
            toastr.info(message, title ?? "", options);
    }
});

window.addEventListener("clearChoices", (event) => {
    multipleCancelButton.forEach(function (choices) {
        choices.removeActiveItems();
    });
});

window.addEventListener("showModal", (event) => {
    // console.log(event);
    $('#commonModal').modal('show');
});

window.addEventListener("hideModal", (event) => {
    // console.log(event);
    $('#commonModal').modal('hide');
});

function showAlert(details) {
    // Create the event
    const event = new CustomEvent("alert", {
        detail: [details],
    });
    // Dispatch/Trigger/Fire the event
    window.dispatchEvent(event);
}

$(document).on('click', '#subNav .nav-link:not([href="#"]), #scrollToTop a:not([href="#"])', function(event){
    if (
        location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '')
    &&
        location.hostname == this.hostname
    ) {
        // Figure out element to scroll to
        var target = $(this.hash);
        target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
        // Does a scroll target exist?
        if (target.length) {
            // Only prevent default if animation is actually gonna happen
            event.preventDefault();
            navHeight = $('#subNav').height();
            // console.log(target.offset().top);
            // console.log(navHeight);
            const finalTarget = target.offset().top - navHeight - 60;
            // console.log(finalTarget);
            $('html, body').animate({
                scrollTop: finalTarget
            }, 1000);
        }
        const bodyWidth = $('body').width();
        // console.log('width', bodyWidth);
        if(bodyWidth < 992) {
            $('#subNavigation').removeClass('show');
            $('.sub-nav-btn').addClass('collapsed');
        }
    }
});

// When the user scrolls down 20px from the top of the document, show the button
// let scrollBtn = document.getElementById("scrollToTop");
// window.onscroll = function() {scrollFunction()};

// function scrollFunction() {
//     if (document.body.scrollTop > 200 || document.documentElement.scrollTop > 200) {
//         scrollBtn.style.display = "flex";
//     } else {
//         scrollBtn.style.display = "none";
//     }
// }

$(document).on('scroll', function(){
    scrollBtn = document.getElementById("scrollToTop");
    // console.log(document.body.scrollTop);
    if (document.body.scrollTop > 200 || document.documentElement.scrollTop > 200) {
        scrollBtn.style.display = "flex";
    } else {
        scrollBtn.style.display = "none";
    }
});


// window.initChoice = function initChoice(selector, config = ''){
//     if(config == ''){
//         config = {
//             removeItemButton: true,
//             allowHTML: true,
//             classNames: {
//                 containerInner: ['form-select'],
//                 input: ['w-100', 'border-0', 'p-0', 'm-0'],
//             }
//         };
//     }
//     return new Choices(selector, config);
// }


// multipleCancelButton = new Array();
// if ($(".multi-select").length > 0) {
//     $(".multi-select").each(function( index,element ) {
//         let selector = '#' + $(element).attr('id');
//         let choices = initChoice(selector);
//         multipleCancelButton.push(choices);
//         element.addEventListener('change', function (e) {
//             if(e.target.options.length !== e.target.selectedOptions.length){
//                 choices._clearNotice();
//             }
//         });
//     });
// }

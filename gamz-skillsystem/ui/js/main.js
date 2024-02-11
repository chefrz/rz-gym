$(document).ready(function () {
    window.addEventListener('message', (event) => {
        if (event.data.type === 'update') {
            switch (event.data.skill) {
                case 'MP0_STAMINA':
                    $('.stamina').html(+(event.data.skillValue).toFixed(2)+'%')
                    var staminaNumber = $('.stamina').html();
                    $('.stamina-column').css('width', staminaNumber);
                    break;
                case 'MP0_STRENGTH':
                    $('.strength').html(+(event.data.skillValue).toFixed(2)+'%')
                    var strengthNumber = $('.strength').html();
                    $('.strength-column').css('width', strengthNumber);
                    break;
                case 'MP0_LUNG_CAPACITY':
                    $('.lungcapacity').html(+(event.data.skillValue).toFixed(2)+'%')
                    var lungcapacityNumber = $('.lungcapacity').html();
                    $('.lungcapacity-column').css('width', lungcapacityNumber);
                    break;
                case 'MP0_DRIVING_ABILITY':
                    $('.driving').html(+(event.data.skillValue).toFixed(2)+'%')
                    var drivingNumber = $('.driving').html();
                    $('.driving-column').css('width', drivingNumber);
                    break;
                case 'MP0_WHEELIE_ABILITY':
                    $('.wheelie').html(+(event.data.skillValue).toFixed(2)+'%')
                    var wheelieNumber = $('.wheelie').html();
                    $('.wheelie-column').css('width', wheelieNumber);
                    break;
                }
        } else if (event.data.type === 'close') {
            $(`#main`).fadeOut(100, () => $(`#main`).css({display:"none"}));
        } else if (event.data.type === 'open') {
            $(`#main`).fadeIn(600, () => $(`#main`).css({display:"block"}));
        }
    });
});
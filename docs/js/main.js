var typed = new Typed('#description-typed', {
    strings: ["The programmers keyboard", "The hackers keyboard", "The delightful keyboard"],
    typeSpeed: 80,
    smartBackspace: false,
    typeSpeed: 70,
    startDelay: 1000,
    backSpeed: 60,
    backDelay: 1300,
    preStringTyped: (arrayPos, self) => {
        press_rnd_keys();
    },

    onStringTyped: (arrayPos, self) => {
        release_keys();
    }
});


let keys = $('.key');
var interval = null;

function press_rnd_keys()
{
    interval = setInterval(function() {
        let rnd_key = Math.floor(Math.random() * keys.length);
        keys.eq(rnd_key).addClass('key_pressed');
    }, 100);
}

function release_keys()
{
    clearInterval(interval);
    keys.removeClass('key_pressed');
}

let ButtonsData = [];
let Buttons = [];
let Button = [];

const OpenMenu = (data) => {
    DrawButtons(data)
}

const CloseMenu = () => {
    $("#img").hide()
    $("#img").attr('src', '')

    for (let i = 0; i < ButtonsData.length; i++) {
        $(".button").remove();
    }
    ButtonsData = [];
    Buttons = [];
    Button = [];
};

const DrawButtons = (data) => {
    ButtonsData = data
    for (let i = 0; i < ButtonsData.length; i++) {

        const header = ButtonsData[i].header || ""
        const message = ButtonsData[i].txt || ""
        const id = ButtonsData[i].id

        const style = ButtonsData[i].style || 'normal'

        let active = ButtonsData[i].active

        if (active == null) {
            active = true
        }

        let element = ""
        let sticky = false

        if (ButtonsData[i].params) {
            sticky = ButtonsData[i].params.sticky
        }

        if (sticky == true) {
            element = `<div class="button ${active} ${style}" style = "position:fixed;margin-left: -120px; width:120px" , id=${id}><div class="menuitem-left" id=${id}>`
        } else {
            element = `<div class="button ${active} ${style}" id=${id}><div class="menuitem-left" id=${id}>`
        }

        if (header != "") {
            element = element + `<div class="title" id=${id}>${header}</div>`
        }

        if (message != "") {
            element = element + `<div class="description" id=${id}>${message}</div></div>`
        } else {
            element = element + `</div></div>`
        }

        if (ButtonsData[i].params) {
            if (ButtonsData[i].params.arrow && active) {
                element = element + `<div class="menuitem-right" id=${id}><i class="fa-duotone fa-chevrons-right" id=${id}></i></div>`
            }
        }

        element = element + `</div>`

        $('#menu').append(element);
        Buttons[id] = element
        if (ButtonsData[i].params) {
            Button[id] = ButtonsData[i].params
        }

    }
}

$(document).on('mouseenter', '.button', function (event) {
    let $target = $(event.target);
    if ($target.closest('.button.true').length && $('.button').is(":visible")) {
        let id = event.target.id;

        const buttonData = ButtonsData.find(button => button.id === Number(id))
        if (!buttonData) return

        const image = buttonData.image
        if (image) {
            $("#img").attr("src", image);
            $("#img").show()
        }

        if (!Button[id]) return;
        HoverRun(id);
    }
});

$(document).on('mouseleave', '.button', function (event) {
    let $target = $(event.target);
    if ($target.closest('.button.true').length && $('.button').is(":visible")) {
        let id = event.target.id;

        const buttonData = ButtonsData.find(button => button.id === Number(id))
        if (!buttonData) return

        const image = buttonData.image
        if (!image) return

        if ($("#img").attr('src') === image) {
            $("#img").hide()
            $("#img").attr('src', '')
        }

        if (!Button[id]) return;
        HoverRun(id);
    }
})

$(document).click(function (event) {
    let $target = $(event.target);
    if ($target.closest('.button.true').length && $('.button').is(":visible")) {
        let id = event.target.id;
        if (!Button[id]) return
        PostData(id)
    }
})

const HoverRun = (id) => {
    $.post(`https://erp-context/dataHover`, id)
}

const PostData = (id) => {
    $.post(`https://erp-context/dataPost`, id)
    if (Button[id].closeMenu === false) return;
    return CloseMenu();
}

const CancelMenu = () => {
    $.post(`https://erp-context/cancel`)
    return CloseMenu();
}

window.addEventListener("message", (evt) => {
    const data = evt.data
    const info = data.data
    const action = data.action
    switch (action) {
        case "OPEN_MENU":
            return OpenMenu(info);
        case "CLOSE_MENU":
            return CloseMenu();
        default:
            return;
    }
})


document.onkeyup = function (event) {
    event = event || window.event;
    var charCode = event.keyCode || event.which;
    if (charCode == 27) {
        CancelMenu();
    }
};
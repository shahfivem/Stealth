//███████╗██╗   ██╗███╗   ██╗ ██████╗██╗████████╗ ██████╗ ███╗   ██╗███████╗
//██╔════╝██║   ██║████╗  ██║██╔════╝██║╚══██╔══╝██╔═══██╗████╗  ██║██╔════╝
//█████╗  ██║   ██║██╔██╗ ██║██║     ██║   ██║   ██║   ██║██╔██╗ ██║███████╗
//██╔══╝  ██║   ██║██║╚██╗██║██║     ██║   ██║   ██║   ██║██║╚██╗██║╚════██║
//██║     ╚██████╔╝██║ ╚████║╚██████╗██║   ██║   ╚██████╔╝██║ ╚████║███████║
//╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═══╝╚══════╝
function showHomePage() {
    document.getElementById('homePage').style.display = 'block';
}

function hideUI() {
    document.getElementById('homePage').style.display = 'none';
    fetch(`https://${GetParentResourceName()}/releaseFocus`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({})
    });
}

function showGangHelpMenu() {
    document.getElementById('homePage').style.display = 'none';
    fetch(`https://${GetParentResourceName()}/showGangHelpMenu`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({})
    });
}

//██╗     ██╗███████╗████████╗███████╗███╗   ██╗███████╗██████╗ ███████╗
//██║     ██║██╔════╝╚══██╔══╝██╔════╝████╗  ██║██╔════╝██╔══██╗██╔════╝
//██║     ██║███████╗   ██║   █████╗  ██╔██╗ ██║█████╗  ██████╔╝███████╗
//██║     ██║╚════██║   ██║   ██╔══╝  ██║╚██╗██║██╔══╝  ██╔══██╗╚════██║
//███████╗██║███████║   ██║   ███████╗██║ ╚████║███████╗██║  ██║███████║
//╚══════╝╚═╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚══════╝

// Register NUI callback function
window.addEventListener('message', function (event) {
    // Check if the message is from the expected source and contains the expected data
    if (event.data.type === 'openUI') {
        showHomePage(); // Show the home page by default
        // Update gang name if available
        if (event.data.gangName) {
            document.getElementById('gangName').innerText = event.data.gangName;
            document.getElementById('gangStatus').innerText = event.data.gangStatus;
            document.getElementById('homeTurf').innerText = event.data.homeTurf;
            document.getElementById('gradeName').innerText = event.data.gradeName;
            document.getElementById('count').innerText = event.data.count;
            document.getElementById('prevalenceStars').innerText = event.data.prevalenceStars;
        }
        if (event.data.gangImage) {
            // Set the src attribute of the gang image
            document.getElementById('gangImage').src = event.data.gangImage;
        }
    } else if (event.data.type === 'hideUI') {
        hideUI();
    }
});

// Event listener to close UI when ESC key is pressed
document.addEventListener('keydown', function (event) {
    if (event.key === 'Escape') {
        hideUI();
    }
});
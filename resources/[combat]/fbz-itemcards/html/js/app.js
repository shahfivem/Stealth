window.addEventListener('message', function(event) {
    const data = event.data;

    if (data.action === 'show') {
        document.getElementById('card-image').src = data.image;
        document.getElementById('card-title').innerText = data.title;
        document.getElementById('card-description').innerText = data.description;
        document.getElementById('card').style.display = 'block';

        setTimeout(function() {
            document.getElementById('card').style.display = 'none';
            fetch(`https://${GetParentResourceName()}/close`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({})
            });
        }, 5000);
    }

    if (data.action === 'hide') {
        document.getElementById('card').style.display = 'none';
    }
});

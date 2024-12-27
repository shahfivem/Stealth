$(function () {
	window.addEventListener('message', function (event) {
			let data = event.data;
			if (data.show == true) {
				$(".main-container").show().css("display","flex");
				$(".main-container").addClass("animate__animated animate__backInRight");
				$(".playercount").html(`${data.players}/${data.max}`)
				$('.actual-id').html(data.id)
			} else if (data.show == false) {
				if ($(".main-container").hasClass("animate__animated animate__backInRight")) {
					$(".main-container").removeClass("animate__animated animate__backInRight");
					$(".main-container").addClass("animate__animated animate__backOutRight");
					setTimeout(function() {
						$(".main-container").hide().css("display","none");
						$(".main-container").removeClass("animate__animated animate__backOutRight");
					}, 500);
				}
			}
	});
});
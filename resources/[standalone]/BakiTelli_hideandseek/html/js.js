var createorjoin = "";
var ingame = false;
console.log("discord.gg/debux | Tebex : debux.tebex.io");
$(document).ready(function () {
  window.addEventListener("message", function (event) {
    if (event.data.action == "open") {
      if (event.data.typ == "main") {
        $("body").css("display", "flex");
        $(".all-CSS").css("display", "block");
        $(".one").css("display", "block");
      }
    } else if (event.data.action == "update") {
      if (event.data.typ == "MainPlayerDetails") {
        details = event.data.detail;
        $(".Profilename").html(details.name);
        $(".profilecreditprice").html("$" + details.moneybank);
        $(".profilewalletprice").html("$" + details.moneycash);
      }
    } else if (event.data.action == "loadLobby") {
      if (event.data.xxs % 2 === 0) {
        if (event.data.password == true) {
          html =
            `
              <div class="Server xxs"  id="` +
            event.data.name +
            `" onclick="showLobby(this.id)">
                  <div class="ServerProfile" style="background-image:url(./img/` +
            event.data.img +
            `)"></div>
                  <div class="ServerItemText" style="margin-left: 3.3vw; color: rgba(255, 255, 255, 0.70);">` +
            event.data.name +
            `</div>
                  <div class="ServerItemText" style="">` +
            event.data.mapid +
            `</div>
                  <div class="ServerItemText">` +
            event.data.time +
            `m</div>
                  <div class="ServerItemText">Max 10p</div>
                  <div class="ServerJoin" id="` +
            event.data.name +
            `" onclick="LoginLobby(this.id)">SHOW &#xf023;</div>

                </div>
    `;
        } else {
          html =
            `
              <div class="Server xxs"  id="` +
            event.data.name +
            `" onclick="showLobby(this.id)">
                  <div class="ServerProfile" style="background-image:url(./img/` +
            event.data.img +
            `)"></div>
                  <div class="ServerItemText" style="margin-left: 3.3vw; color: rgba(255, 255, 255, 0.70);">` +
            event.data.name +
            `</div>
                  <div class="ServerItemText" style="">` +
            event.data.mapid +
            `</div>
                  <div class="ServerItemText">` +
            event.data.time +
            `m</div>
                  <div class="ServerItemText">Max 10p</div>
                  <div class="ServerJoin" id="` +
            event.data.name +
            `" onclick="LoginLobby(this.id)">zzzzzz &#xf09c;</div>

                </div>
    `;
        }
      } else {
        if (event.data.password == true) {
          html =
            `
              <div class="Server"  id="` +
            event.data.name +
            `" onclick="showLobby(this.id)">
                  <div class="ServerProfile" style="background-image:url(./img/` +
            event.data.img +
            `)"></div>
                  <div class="ServerItemText" style="margin-left: 3.3vw; color: rgba(255, 255, 255, 0.70);">` +
            event.data.name +
            `</div>
                  <div class="ServerItemText" style="">` +
            event.data.mapid +
            `</div>
                  <div class="ServerItemText">` +
            event.data.time +
            `m</div>
                  <div class="ServerItemText">Max 10p</div>
                  <div class="ServerJoin" id="` +
            event.data.name +
            `" onclick="LoginLobby(this.id)">xcxccc &#xf023;</div>

                </div>
    `;
        } else {
          html =
            `
              <div class="Server"  id="` +
            event.data.name +
            `" onclick="showLobby(this.id)">
                  <div class="ServerProfile" style="background-image:url(./img/` +
            event.data.img +
            `)"></div>
                  <div class="ServerItemText" style="margin-left: 3.3vw; color: rgba(255, 255, 255, 0.70);">` +
            event.data.name +
            `</div>
                  <div class="ServerItemText" style="">` +
            event.data.mapid +
            `</div>
                  <div class="ServerItemText">` +
            event.data.time +
            `m</div>
                  <div class="ServerItemText">Max 10p</div>
                  <div class="ServerJoin" id="` +
            event.data.name +
            `" onclick="LoginLobby(this.id)">qqqq &#xf09c;</div>

                </div>
    `;
        }
      }
      $(".Servers").prepend(html);
    } else if (event.data.action == "closeAllMenu") {
      CloseMenu();
      if (event.data.t) {
        ingame = true;
      }
    } else if (event.data.action == "perm") {
      if (event.data.tx == "owner") {
        $(".start").css("opacity", 1);
        $(".disabled").css("opacity", 1);
      } else {
        $(".start").css("opacity", 0.24);
        $(".disabled").css("opacity", 0.25);
      }
    } else if (event.data.action == "timeupdate") {
      $(".CurrentTime").html(event.data.time + " Minutes");
    } else if (event.data.action == "playersDefault") {
      if (event.data.typ == "reset") {
        DefaultPlayers();
      } else {
        $("#" + event.data.team + event.data.num + " .team-id").html(
          "ID: " + event.data.src
        );
        $("#" + event.data.team + event.data.num + " .team-name").html(
          event.data.name
        );
        if (event.data.profile == "null") {
          $("#" + event.data.team + event.data.num + " .profilePhotoImg").css(
            "background-image",
            "url(https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Windows_10_Default_Profile_Picture.svg/1024px-Windows_10_Default_Profile_Picture.svg.png)"
          );
        } else {
          var xhr = new XMLHttpRequest();
          xhr.responseType = "text";
          xhr.open("GET", event.data.steamid, true);
          xhr.send();
          xhr.onreadystatechange = processRequest;
          function processRequest(e) {
            if (xhr.readyState == 4 && xhr.status == 200) {
              var string = xhr.responseText.toString();
              var array = string.split("avatarfull");
              var array2 = array[1].toString().split('"');
              $(
                "#" + event.data.team + event.data.num + " .profilePhotoImg"
              ).css("background-image", "url(" + array2[2].toString() + ")");
            }
          }
        }
      }
    } else if (event.data.action == "update-teamp") {
      $("#red-total").html("TOTAL PLAYER " + event.data.red);
      $("#blue-total").html("TOTAL PLAYER " + event.data.blue);
    } else if (event.data.action == "mapupdate") {
      $(".map-title-max").html(event.data.LobbyName);
      $(".MyLobbyDetailsPhotoSideTitle p").html(event.data.name);
      $(".MyLobbyDetailsTitle t").html(event.data.name);
      $(".map-iy").html(event.data.LobbyInformation);
      $("#locationname").html(event.data.LobbyName);
      $(".MyLobbyDetailsPhoto").css(
        "background-image",
        'linear-gradient(180deg, rgba(9, 9, 13, 0.77) 0%, rgba(9, 9, 13, 0) 100%), url("' +
          event.data.LobbyImg +
          '")'
      );
    } else if (event.data.action == "loginpassword") {
      OpenInputMenu("login");
    } else if (event.data.action == "get-px") {
      InputMenuClose();
      $(".one").css("display", "none");
      $(".two").css("display", "block");
      DefaultPlayersDetail();
    } else if (event.data.action == "saytime") {
      if (ingame) {
        $(".black").css("display", "none");
        if (event.data.time == 0) {
          $("body").css("display", "none");
          $(".time").css("display", "none");
        } else {
          $("body").css("display", "flex");
          $(".time").css("display", "flex");
        }
        $(".keyboardInfo").css("display", "block");
        $(".time-text").html(event.data.time);
      }
    } else if (event.data.action == "black-screen") {
      if (ingame) {
        $(".time").css("display", "none");
        if (event.data.time == 0) {
          $("body").css("display", "none");
          $(".black").css("display", "none");
        } else {
          $("body").css("display", "flex");
          $(".black").css("display", "flex");
        }
        $(".keyboardInfo").css("display", "none");
        $(".black-time-text").html(event.data.time);
      }
    } else if (event.data.action == "scoreboard") {
      if (event.data.display) {
        $("body").css("display", "flex");
        $(".scoreboard").css("display", "flex");
      } else {
        $("body").css("display", "none");
        $(".scoreboard").css("display", "none");
      }
    } else if (event.data.action == "time-update") {
      if (event.data.timeri <= 0) {
        $(".timer-bar").html("00:00");
      } else {
        $(".timer-bar").html(event.data.timeri);
      }
    } else if (event.data.action == "win-lose") {
      $("body").css("display", "flex");
      $(".scoreboard").css("display", "none");
      $(".time").css("display", "none");
      $(".black").css("display", "none");
      $(".scoreboard").css("display", "none");
      ingame = false;
      if (event.data.typ == "win") {
        $(".win").css("display", "flex");
      } else if (event.data.typ == "lose") {
        $(".lose").css("display", "flex");
      } else {
        $(".draw").css("display", "flex");
      }
    } else if (event.data.action == "score-update") {
      $("#red-s").html(event.data.red);
      $("#blue-s").html(event.data.blue);
      KillingDefault();
    } else if (event.data.action == "killing-update") {
      KillingDefault();
      if (event.data.kill == 1) {
        $("#kbir").html("X");
      } else if (event.data.kill == 2) {
        $("#kbir").html("X");
        $("#kiki").html("X");
      } else if (event.data.kill == 3) {
        $("#kbir").html("X");
        $("#kiki").html("X");
        $("#kuc").html("X");
      } else if (event.data.kill == 4) {
        $("#kbir").html("X");
        $("#kiki").html("X");
        $("#kuc").html("X");
        $("#kdort").html("X");
      } else if (event.data.kill == 5) {
        $("#kbir").html("X");
        $("#kiki").html("X");
        $("#kuc").html("X");
        $("#kdort").html("X");
        $("#kbes").html("X");
      }
    } else if (event.data.action == "KillProfile") {
      KillProfileDefault();
      if (event.data.player == 1) {
        $("#kiki").css("display", "none");
        $("#kuc").css("display", "none");
        $("#kdort").css("display", "none");
        $("#kbes").css("display", "none");
      } else if (event.data.player == 2) {
        $("#kuc").css("display", "none");
        $("#kdort").css("display", "none");
        $("#kbes").css("display", "none");
      } else if (event.data.player == 3) {
        $("#kdort").css("display", "none");
        $("#kbes").css("display", "none");
      } else if (event.data.player == 4) {
        $("#kbes").css("display", "none");
      }
    } else if (event.data.action == "timer") {
      let timerInterval;
      Swal.fire({
        title: "Incoming Data!",
        html: "Wait Please",
        timer: 400,
        background: "rgba(1, 4, 6, 0.0)",
        width: 600,
        iconColor: "white",
        padding: "0.5em",
        color: "#FFFFFF",
        timerProgressBar: false,
        didOpen: () => {
          Swal.showLoading();
          const b = Swal.getHtmlContainer().querySelector("b");
          timerInterval = setInterval(() => {
            // b.textContent = Swal.getTimerLeft();
          }, 100);
        },
        willClose: () => {
          clearInterval(timerInterval);
        },
      }).then((result) => {
        /* Read more about handling dismissals below */
        if (result.dismiss === Swal.DismissReason.timer) {
          // console.log("I was closed by the timer");
        }
      });
    }
  });
});

$(document).on("keydown", function (event) {
  switch (event.keyCode) {
    case 27:
      CloseMenu();
  }
});

function CloseMenu() {
  DefaultMenu();
  $.post("https://BakiTelli_hideandseek/close");
}

function DefaultMenu() {
  $("body").css("display", "none");
  $(".scoreboard").css("display", "none");
  InputMenuClose();
  $(".all-CSS").css("display", "none");
  $(".one").css("display", "none");
  $(".two").css("display", "none");
  $(".Servers").empty();
  $(".win").css("display", "none");
  $(".lose").css("display", "none");
  $(".draw").css("display", "none");
  $("#red-s").html("0");
  $("#blue-s").html("0");
  $(".time").css("display", "none");
  $(".scoreboard").css("display", "none");
}

function OpenInputMenu(typ) {
  $(".passwordinput").val("");
  $(".inputMenuBG").css("display", "flex");
  createorjoin = typ;
  if (typ == "create") {
    $(".passwordjoincreate").html("Create");
    $(".PasswordWarning > .text").html(
      "If you are setting up a room without a password, leave the password field blank"
    );
    $(".passwordjoincreate").css(
      "background",
      "linear-gradient(180deg, #C99649 0%, rgba(201, 150, 73, 0.00) 142.86%)"
    );
  } else {
    $(".passwordjoincreate").html("Join");
    $(".PasswordWarning > .text").html(
      "Only the room owner can access the password!"
    );
    $(".passwordjoincreate").css("background", "");
  }
}

function InputMenuClose() {
  $(".inputMenuBG").css("display", "none");
}

function ClickCreateJoin() {
  possword = $(".passwordinput").val();
  if (createorjoin == "create") {
    InputMenuClose();
    $(".one").css("display", "none");
    $(".two").css("display", "block");
    DefaultPlayersDetail();
    $.post(
      "https://BakiTelli_hideandseek/NewLobby",
      JSON.stringify({
        password: possword,
      })
    );
  } else {
    InputMenuClose();
    $(".one").css("display", "none");
    $(".two").css("display", "block");
    DefaultPlayersDetail();
    $.post(
      "https://BakiTelli_hideandseek/checkPassword",
      JSON.stringify({
        password: possword,
      })
    );
  }
}

function DefaultPlayersDetail() {
  var teams = ["red", "blue"];
  var players = ["1", "2", "3", "4", "5"];
  teams.forEach(function (team) {
    players.forEach(function (player) {
      var selector = "#" + team + player;
      $(selector + " .profilePhotoImg").css(
        "background-image",
        "url(./img/add.png)"
      );
      $(selector + " .team-name").html("Join Team");
      $(selector + " .team-id").html("None");
    });
  });
}

function DefaultPlayers() {
  var teams = ["red", "blue"];
  var players = ["1", "2", "3", "4", "5"];
  teams.forEach(function (team) {
    players.forEach(function (player) {
      var selector = "#" + team + player;
      $(selector + " .profilePhotoImg").css(
        "background-image",
        "url(./img/add.png)"
      );
      $(selector + " .team-name").html("Join Team");
      $(selector + " .team-id").html("None");
    });
  });
}

function LoginTeam(team, num) {
  $.post(
    "https://BakiTelli_hideandseek/LoginTeam",
    JSON.stringify({
      team: team,
      num: num,
    })
  );
}

function Time(typ, time) {
  $.post(
    "https://BakiTelli_hideandseek/Time",
    JSON.stringify({
      time: time,
      typ: typ,
    })
  );
}

function Next() {
  $.post("https://BakiTelli_hideandseek/Next");
}

function Previous() {
  $.post("https://BakiTelli_hideandseek/Previous");
}

function showLobby(name) {
  $.post(
    "https://BakiTelli_hideandseek/showLobby",
    JSON.stringify({
      name: name,
    })
  );
}

function LoginLobby(name) {
  $.post(
    "https://BakiTelli_hideandseek/LoginLobby",
    JSON.stringify({
      name: name,
    })
  );
}

function Disband() {
  $.post("https://BakiTelli_hideandseek/Disband");
}

function Start() {
  $.post("https://BakiTelli_hideandseek/Start");
}

function KillingDefault() {
  $("#kbir").html("");
  $("#kiki").html("");
  $("#kuc").html("");
  $("#kdort").html("");
  $("#kbes").html("");
}

function KillProfileDefault() {
  $("#kbir").css("display", "flex");
  $("#kiki").css("display", "flex");
  $("#kuc").css("display", "flex");
  $("#kdort").css("display", "flex");
  $("#kbes").css("display", "flex");
}

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <link href="fullcalendar/main.css" rel="stylesheet" />
    <link rel="stylesheet" href="./style.css" />
    <script src="fullcalendar/main.js"></script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        let earliestStartTime, lastEndTime

        var calendarEl = document.getElementById("calendar");
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: "timeGridWeek",
          allDaySlot: false,
          events: {
            url: "http://localhost:3000/events",
            method: "GET",
            failure: function () {
              alert("there was an error while fetching events!");
            },
          },
          eventDidMount: function(arg) {
              const eventStartTime = arg.event.start.getHours()
              const eventEndTime = arg.event.end.getHours()

              if (!earliestStartTime) {
                  // when undefined
                  earliestStartTime = eventStartTime
              } else if (eventStartTime < earliestStartTime) {
                  earliestStartTime = eventStartTime
              }

              if (!lastEndTime) {
                  // when undefined
                  lastEndTime = eventEndTime
              } else if (eventEndTime > lastEndTime){
                  lastEndTime = eventEndTime
              }

              calendar.setOption('slotMinTime', `${earliestStartTime}:00:00`);
              calendar.setOption('slotMaxTime', `${lastEndTime + 1}:00:00`);
          }
        });
        calendar.render();
      });
    </script>
  </head>
  <body>
    <div id="calendar"></div>
  </body>
</html>

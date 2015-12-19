$(document).ready ->
  $("#calendar").fullCalendar
    schedulerLicenseKey: "CC-Attribution-NonCommercial-NoDerivatives"
    header:
      center: "month, agendaWeek, agendaDay" # buttons for switching between views

    views:
      day:
        defaultView: "agendaDay"

      week:
        defaultView: "agendaWeek"

    events: []
    resources: [
      id: "1"
      title: "room 1",
      id: "2"
      title: "room 2",
      id: "3"
      title: "room 3"
     ]

  $('.datetimepicker').datetimepicker();


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

    events: [
      
    ]
    resources: [
      id: "1"
      title: "Northside",
      id: "3"
      title: "Garage",
      id: "2"
      title: "Southside"
    ]

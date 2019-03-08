import flatpickr from "flatpickr"
// import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import "flatpickr/dist/themes/airbnb.css"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

flatpickr(".datepicker", {
  allowInput: true,
  altInput: true, // nice date format Month day, year
  mode: "range",
  // disable: [
  //   @flat.reservations.forEach(reservation)

  //   {
  //     from: "2019-03-11",
  //     to: "2019-03-21"
  //   }
  // ]
})

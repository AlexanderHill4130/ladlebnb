import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

flatpickr(".datepicker", {
   "disable": [
        function(date) {
            const today = new Date();
            today.setHours(0,0,0,0);
            return (date < today);

        }]                     // return true to disable
});

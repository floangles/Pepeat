//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require moment
//= require moment/fr.js
//= require fullcalendar
//= require underscore
//= require gmaps/google
//= require bootstrap-datetimepicker
//= require_tree ./app



// Please do not put any code in here. Create a new .js file in
// app/assets/javascripts/app instead, and put your code there

$(function() {
  $('[data-provide=datepicker]').datetimepicker({
    locale: 'fr',
    sideBySide: true
  });
});

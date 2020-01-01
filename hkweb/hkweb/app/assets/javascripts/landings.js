// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var selector = ".js-select-group";
var selectorInput = ".js-new-group-input";
$(document).ready(function() {
  toggleNewGroupInput();

  $(selector).on("change", toggleNewGroupInput);
});

function toggleNewGroupInput() {
  if ($(selector).val() === "") {
    $(selectorInput).show();
    $(selector).removeClass("w-100").addClass("w-25");
  }
  else
  {
    $(selectorInput).hide();
    $(selector).removeClass("w-25").addClass("w-100");
  }
}

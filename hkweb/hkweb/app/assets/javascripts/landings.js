// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  var $selector = $(".js-select-group");
  var $selectorInput = $(".js-new-group-input");

  toggleNewGroupInput($selector, $selectorInput);

  $selector.on("change", toggleNewGroupInput);

});

function toggleNewGroupInput($selector, $selectorInput) {
  if ($selector.val() === "") {
    $selectorInput.show();
  }
  else
  {
    $selectorInput.hide();
  }
}

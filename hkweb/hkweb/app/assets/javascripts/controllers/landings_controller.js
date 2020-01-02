App.LandingsController = (function() {
  function indexAction() {
    var landingHeaderSelector = ".js-landing-header";

    $(landingHeaderSelector).on("click", editField(landingHeaderSelector));
  }

  function editAction() {
    var selectGroupSelector = ".js-select-group";

    $(selectGroupSelector).on("change", { selectGroupSelector: selectGroupSelector }, App.LandingsController.toggleNewGroupInput);
    $(selectGroupSelector).trigger("change");
  }

 function toggleNewGroupInput(event) {
    var $newGroupInputSelector = $(".js-new-group-input");
    var $selectGroupSelector = $(event.data["selectGroupSelector"]);

    if ($(event.currentTarget).val() === "") {
      $newGroupInputSelector.show();
      $selectGroupSelector.removeClass("w-100").addClass("w-25");
    }
    else
    {
      $newGroupInputSelector.hide();
      $selectGroupSelector.removeClass("w-25").addClass("w-100");
    }
  }

  function editField(landingHeaderSelector) {
    // Add code here
  }

  return {
    indexAction: indexAction,
    editAction: editAction,
    toggleNewGroupInput: toggleNewGroupInput
  };
})();


function editField(fieldSelector) {
}


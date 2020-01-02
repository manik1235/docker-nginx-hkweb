module ApplicationHelper
  def javascript_controller
    controller.controller_name.camelize
  end

  def javascript_action
    action_name.camelcase(:lower)
  end
end

module ApplicationHelper

  def screen_selected_class(listed_screen_id)
    if screen.present? && screen.device_id == listed_screen_id
      ' class="selected"'.html_safe
    end
  end

end

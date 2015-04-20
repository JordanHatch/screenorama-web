module ApplicationHelper

  def screen_classes(listed_screen)
    classes = []

    if screen.present? && screen.device_id == listed_screen.device_id
      classes << 'selected'
    end

    if listed_screen.online?
      classes << 'online'
    end

    " class=\"#{classes.join(' ')}\"".html_safe
  end

end

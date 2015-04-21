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

  def name_and_device_id(screen)
    if screen.name.present?
      (
        screen.name + " " +
        content_tag(:span, sanitize(screen.short_device_id), class: 'device-id')
      ).html_safe
    else
      screen.short_device_id
    end
  end

  def filtered_url(url)
    regexp = /((https?:\/\/)(.+)\:(.+)@)/
    replacement = "\\2∗∗∗∗∗∗∗@"

    url.sub(regexp, replacement)
  end

end

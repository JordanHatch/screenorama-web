class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private
  def screens
    @screens ||= Screen.with_urls
  end
  helper_method :screens

  def new_screens
    @new_screens ||= Screen.without_urls
  end
  helper_method :new_screens

  def authenticate!
    return unless ENV['USERNAME'].present? && ENV['PASSWORD'].present?

    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['USERNAME'] && password == ENV['PASSWORD']
    end
  end
end

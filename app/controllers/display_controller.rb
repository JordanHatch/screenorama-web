class DisplayController < ApplicationController
  layout 'display'
  after_action :allow_iframes

  def show
    unless screen.present?
      Screen.create(device_id: params[:id])
    end
  end

private
  def screen
    @screen ||= Screen.find_by_device_id(params[:id])
  end
  helper_method :screen

  def allow_iframes
    response.headers.except! 'X-Frame-Options'
  end
end

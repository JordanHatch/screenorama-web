class DisplayController < ApplicationController
  layout 'display'

  def show
  end

private
  def screen
    @screen ||= Screen.find_by_device_id(params[:id])
  end
  helper_method :screen
end

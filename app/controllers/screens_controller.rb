class ScreensController < ApplicationController
  before_filter :authenticate!, except: :show

  def index
  end

  def new
    self.screen = Screen.new
  end

  def create
    self.screen = Screen.new(screen_params)

    if screen.save
      flash.notice = 'Screen saved'
      redirect_to screens_path
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if screen.update_attributes(screen_params)
      flash.notice = 'Screen updated'
      redirect_to screens_path
    else
      render action: :edit
    end
  end

  def last_requested_at
    screen.update_last_requested_at!
    head :ok
  end

private
  attr_writer :screen

  def screen
    @screen ||= Screen.find_by_device_id(params[:id])
  end
  helper_method :screen

  def screen_params
    params.require(:screen).permit(:device_id, :url, :name)
  end

end

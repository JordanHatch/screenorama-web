class Screen < ActiveRecord::Base
  validates :device_id, presence: true

  def short_device_id
    device_id[0..6]
  end

  def to_param
    device_id
  end
end

class Screen < ActiveRecord::Base
  validates :device_id, presence: true

  def to_param
    device_id
  end
end

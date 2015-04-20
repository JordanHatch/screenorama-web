class Screen < ActiveRecord::Base
  validates :device_id, presence: true

  def short_device_id
    device_id[0..6]
  end

  def to_param
    device_id
  end

  def update_last_requested_at!
    self.last_requested_at = Time.now
    save!
  end

  def online?
    last_requested_at.present? && last_requested_at > 1.minute.ago
  end
end

class Screen < ActiveRecord::Base
  validates :device_id, presence: true

  scope :with_urls, -> { where("url IS NOT NULL AND url != ''") }
  scope :without_urls, -> { where("url IS NULL OR url = ''") }

  default_scope -> { order('name ASC, device_id ASC') }

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
    last_requested_at.present? && last_requested_at > 30.seconds.ago
  end
end

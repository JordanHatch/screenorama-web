class AddLastRequestedAtToScreens < ActiveRecord::Migration
  def change
    add_column :screens, :last_requested_at, :datetime
  end
end

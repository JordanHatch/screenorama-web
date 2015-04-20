class CreateScreens < ActiveRecord::Migration
  def change
    create_table :screens do |t|
      t.string :device_id, null: false
      t.string :url
      t.timestamps null: false
    end
  end
end

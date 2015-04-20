class AddNameToScreens < ActiveRecord::Migration
  def change
    add_column :screens, :name, :string
  end
end

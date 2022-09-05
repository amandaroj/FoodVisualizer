class AddScansCountToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :scans_count, :integer, default: 0, null: false
  end
end

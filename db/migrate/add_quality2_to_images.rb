class AddQuality2ToImages < ActiveRecord::Migration
  def change
    add_column :images, :quality2, :integer, default: 0
  end
end
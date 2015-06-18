class AddCustomToImages < ActiveRecord::Migration
  def change
    add_column :images, :custom, :integer, default: 0
  end
end
class AddGtruthToImages < ActiveRecord::Migration
  def change
    add_column :images, :gtruth, :integer
  end
end

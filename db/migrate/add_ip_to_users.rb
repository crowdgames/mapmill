class AddIpToUsers < ActiveRecord::Migration
  def change
    add_column :votes, :ip_address, :ip, :string
  end
end

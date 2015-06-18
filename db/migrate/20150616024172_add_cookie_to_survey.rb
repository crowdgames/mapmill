class AddCookieToSurvey < ActiveRecord::Migration
  def change
    add_column :response_sets, :cookie, :string
  end
end
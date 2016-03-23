class AddExecutedToRide < ActiveRecord::Migration
  def change
  	add_column :rides, :executed, :boolean, default: false
  end
end

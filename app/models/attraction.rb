class Attraction < ActiveRecord::Base
  has_many :rides
  has_many :users, through: :rides
end

=begin
	
class CreateAttractions < ActiveRecord::Migration
 def change
   create_table :attractions do |t|
     t.string  :name
     t.integer :tickets 
     t.integer :nausea_rating 
     t.integer :happiness_rating 
     t.integer :min_height
   end
 end
	
=end
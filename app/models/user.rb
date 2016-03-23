class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if happiness && nausea
  	  happiness > nausea ? 'happy' : 'sad'
    end
  end

end

=begin
class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :name
  		t.integer :happiness
  		t.integer :nausea
  		t.integer :height
  		t.integer :tickets
  		t.boolean :admin, default: false
    end
  end
end
=end

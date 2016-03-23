class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    error=[]
    
    if attraction.tickets > user.tickets
      error << "You do not have enough tickets the #{attraction.name}."
    end

    if attraction.min_height > user.height
      error << "You are not tall enough to ride the #{attraction.name}."
    end 

    if !error.empty?
      "Sorry. " + error.join(" ")
    else
      user.update(
      	           tickets: user.tickets - attraction.tickets,
      	           happiness: user.happiness + attraction.happiness_rating,
      	           nausea: user.nausea + attraction.nausea_rating
      	          )
      update(executed:true)
    end
  end

end


=begin
 create_table "rides", force: :cascade do |t|
    t.integer "user_id"
    t.integer "attraction_id"
    t.boolean "executed",      default: false
  end
=end
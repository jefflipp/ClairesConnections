class Event < ActiveRecord::Base
	has_many :users
	has_many :comments

	has_many :active_attends, 	class_name: "Attend",
                      foreign_key: "attend_id",
                      dependent: :destroy
  has_many :passive_attends, class_name:  "Attend",
               foreign_key: "attending_id",
               dependent:   :destroy

  has_many :attends, through: :active_attends, source: :attended
  has_many :attendings, through: :passive_attends, source: :attendee
  

    

	def attend(other_event)
    active_attends.create(attend_id: other_event.id)
  end

  def unattend(other_event)
    active_attends.find_by(attending_id: other_event.id).destroy
  end

end

class Attend < ActiveRecord::Base
	belongs_to :attend, class_name: "Event"
  belongs_to :attending, class_name: "Event"
  validates :attend_id, presence: true
  validates :attending_id, presence: true
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


events = Event.all
event  = events.first
attending = events[2..50]
attendees = events[3..40]
attending.each { |attended| event.attend(attended) }
attendees.each { |attendee| attendee.attend(event) }
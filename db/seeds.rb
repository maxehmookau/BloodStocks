# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

bloodTypes = ['A', 'B', 'O', 'AB']
postives = [true, false]

bloodTypes.each do |type|
  postives.each do |pos|
    puts "Creating BloodType: #{ type }#{ pos }"
    BloodType.create(letter: type, positive: pos)
  end
end
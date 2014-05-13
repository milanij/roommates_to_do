# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Item.destroy_all

Item.create( name: "Bananas", quantity: 3, description: "Green One's Please!!!!" )
Item.create( name: "PG Tips", quantity: 1, description: "Get the big box, please" )


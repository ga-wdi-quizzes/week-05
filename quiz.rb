require 'pry'

friends = ["Chip Potts", "Cogsworth", "Lumière", "Mrs. Potts"]

friends.each do |friend|
   puts "Belle is friends with #{friend}"
end


binding.pry

puts "Done"
# Using `.each` AND string interpolation, produce output (using `puts`) like so:
#
# Belle is friends with Chip Potts
# Belle is friends with Cogsworth
# Belle is friends with Lumière
# Belle is friends with Mrs. Potts







# Using Ruby, remove Belle from the town residents, and
# add her to the list of guests in the castle.
#
# town = {
#   residents: ["Maurice", "Belle", "Gaston"],
#   castle: {
#     num_rooms: 47,
#     residents: "Robby Benson",
#     guests: []
#   }
# }
# town[:residents].delete("Belle")
# town[:castle][:guests].push("Belle")



# Define a method called `offer_rose`, which should take one argument named `person`.
#
# When called the method should `puts` "Would you take this rose, `person`, in exchange for giving an old beggar woman shelter from the bitter cold?"
#
# Demonstrate calling the method, passing in "young prince" a

def offer_rose(person)
  puts "Would you take this rose, #{person}, in exchange for giving an old beggar woman shelter from the bitter cold?"
end

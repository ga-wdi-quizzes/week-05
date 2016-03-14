# Week 05

## Instructions

1. Fork this repo
2. Clone your fork
3. Fill in your answers by writing in the appropriate area, or placing an 'x' in
the square brackets (for multiple-choice questions).
4. Add/Commit/Push your changes to Github.
5. Open a pull request.

**Note**: only place your answer between backticks. Don't modify the backticks,
or the language specifier after them.

## Ruby Basics & Enumerables (meets Beauty and the Beast)

### Question 1

Define a method called `offerRose`, which should take one argument named person.

When called, the method should `puts`, "Would you take this rose and help out
an old beggar, X?", where X is the person passed into the method.

Demonstrate calling the method with an argument of "young prince".

Write your code here:
```
def offerRose person
  puts "Would you take this rose and help out an old beggar, #{person}?"
end

person "young prince"
```

### Question 2

Assume the following hash:

```ruby
town = {
  residents: ["Maurice", "Belle", "Gaston"],
  castle: {
    num_rooms: 47,
    residents: "Robby Benson",
    guests: []
  }
}
```

Using Ruby, remove Belle from the town residents, and
add her to the list of guests in the castle.

Write your code here:
```
people = town[:residents]
home = town[:castle]
belle = people.delete_at(1)
home.guests.push(belle)


```

### Question 3

Assume you have an array of strings representing friend's names:

```ruby
friends = ["Chip Potts", "Cogsworth", "Lumière", "Mrs. Potts"]
```

Using `.each` AND string interpolation, produce output (using `puts`) like so:

```
Belle is friends with Chip Potts
Belle is friends with Cogsworth
Belle is friends with Lumière
Belle is friends with Mrs. Potts
```

Write your code here:
```
friends.each do |friend|
  puts "Belle is friends with #{friend}"
```

## TDD and RSpec

### Question 4

Describe the differences between unit and functional testing. What type of testing is RSpec and why?

Your answer:
```
Unit tests the functionality of individual methods.  Functional testing tests the overall functionality of software.

RSpec is a unit testing system for test driven development.  It's domain specific and makes testing code easier.  
```

### Question 5

Using the following RSpec test as an example, explain the differences between `describe` and `context`:

```ruby
describe Apartment do
  describe "#add_tenant" do
    subject(:apartment) do
      apartment = Apartment.create(num_beds: 3)
      # we start with 2 tenants (3 bedrooms)
      apartment.add_tenant("alice")
      apartment.add_tenant("bob")
      apartment # return the apartment
    end

    context "when there is room (<= the number of beds)" do
      it "adds a tenant" do
        apartment.add_tenant("Third tenant")
        expect(apartment.tenants.count).to eq(3)
      end
    end
  end
end
```

Your answer:
```
The two mostly do the same thing but are used to add greater specificity to tests.  Describe shows a set of tests for a certain functionality and context denotes a more specific functionality within the 'context' of the overall test started by describe.  
```

## SQL, Databases, and ActiveRecord (meets Aladdin)

### Question 6

Describe what an ERD is, and why we create them for applications. Also give an
example what the attributes and relationships might be for the following
entities (no need to draw an ERD):
<!-- Maybe clarify whether they're meant to give relationships between all four entities or... -->
* Genie
* Lamp
* Person
* Pet

Your answer:
```
An ERD is an entity relationship model.  We create them for applications because they help plan relationships for database tables.  They help us implement relationships between data in apps.
```

### Question 7

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema is a mapping of a table for a database.  We represent a one to many relationship in a SQL database by adding foreign keys to a table.  the addition of foreign keys shows a one-to-many relationship.  For instance, there could be a table of teams in a soccer league and a table also representing individual players on those teams.  Each team would have multiple players, but each player would only have one team.  The players table would have a row pointing to what team a player belongs to.   
```

### Question 8

**Assume:**
1. Your database two working tables, `genies` and `lamps`.
2. You have a working connection to the database for ActiveRecord.
3. You have active record models defined for `Genie` and `Lamp`, and the
relationships between the two are set up in Active Record.
<!-- Do we want to specifiy what kind of relationship they have, in case some students aren't familiar with the mythology...? -->
4. Lamps have one property, `wishes_remaining`, and genies have one property, `name`.

Write code to do the following:

1. Create a lamp with 3 wishes remaining and a genie named 'Genie'

2. Create a relationship between 'Genie' and the lamp.

3. Update the lamp so it only has one wish left.
  * Oh no... Jafar has Aladdin! Thankfully he's wished to become a genie himself!

4. Create a new Genie named 'Jafar' and put him in a new lamp with 3 wishes left.

5. Free the good Genie by setting his lamp to `nil`


Write your code here:
```

myLamp = Lamp.create(wishe_remaining: 3)
myGenie = Genie.create(name: 'Genie')

class Genie < ActiveRecord::Base
  belongs_to :lamp
end

class Lamp <ActiveRecord::Base
  belongs_to :genie
end

myLamp.update(wishes_remaining: 1)

jafar = Genie.create(name: 'Jafar', lamp_id: 1)
jafars_lamp = Lamp.create(wishes_remaining: 3)

jafar.update(lamp_id: nil)
```

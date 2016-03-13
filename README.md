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
```ruby

def offerRose(person)
  puts "Would you take this rose and help out an old beggar, #{person}?"
end

offerRose("young prince")

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
```ruby
town[:castle][:guests] << town[:residents].delete_at(1)
# ROBIN PREFERS PUSH:
town[:castle][:guests].push town[:residents].delete_at(1)
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
```ruby
friends.each do |friend|
    puts "Belle is friends with #{friend}"
end
```

## TDD and RSpec

### Question 4

Describe the differences between unit and functional testing. What type of testing is RSpec and why?

Your answer:
```text

Unit testing aims to test one specific part of a program, like a method or function. Functional testing takes a look at the bigger picture, like how programs interact with each other and is taken more at a user's perspective. RSpec is a great tool for unit testing because it allows you to simulate and test specific parts of your code.
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
```text

Functionally, there is no difference between describe and context. However, contextually, 'context' allows us to easily identify tests being run against the 'describe' situation. In this example, describe is pointing to the method add_tenant and context is running the test scenario.
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
An ERD is a model for displaying relationships between tables in a database (it also shows the columns that belong to a particular table as well). We create them to map out the design of a db and to visualize and establish those relationships.
Using the example provided, a persons table would have attributes such as name, gender, age, etc.
That Person table would then have relationships to two other tables: pets and lamps. The pets table may contain name, species, color, age, etc. and the lamps table may contain attributes such as color, shape, and origin. Both of the pets and lamps table would be linked by a column 'person_id' which establishes a relationship back to the persons table (the pets and lamps do not need to be linked to one another). Finally, the genies table will contain info about the genies: name, age, etc. and would be linked to the lamps table by 'lamp_id'.

```

### Question 7

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
Schemas allows us to map relationships between classes in Ruby with tables in our database.
One-to-many relationships are mapped by columns in the 'dependent' table/schema. Using the example, the wishes table would contain a column represented as so:
  t.integer :people_id
This indicates that an integer corresponds to a primary key number from the people table which synchs the wishes to a person.
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
```ruby
1.
newLamp = Lamp.create(wishes_remaining:3) #id = 1
newGenie = Genie.create(name:'Genie')
2. newGenie.update(lamp_id:1)
3. newLamp.update(wishes_remaining:1)
4. jafarLamp = Lamp.create(wishes_remaining:3) #id = 2
jafar = Genie.create(name:'Jafar',lamp_id:2)
5. newLamp.update(wishes_remaining:nil)
```

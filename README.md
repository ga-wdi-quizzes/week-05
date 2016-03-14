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
Def offerRose(person)
puts "Would you take this rose and help out
an old beggar, #{person}"
end


offerRose(young prince)
or
offerRose = young prince
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
town.residents.delete_at(1)
castle.residents.push("Belle")

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
  puts "Belle is friends with" [:friend]
end
```

## TDD and RSpec

### Question 4

Describe the differences between unit and functional testing. What type of testing is RSpec and why?

Your answer:
```text
Unit testing check the small blocks of code to make sure that input get the specific results you want. With unit testing you check the design, architecture, maintainability and fewer bugs. The tests are individual methods are not intended to be longer than 5 lines.  Unit tests are run before functional tests.

Functional tests look at the bigger picture and have a wider focus. These tests are for Functionalities on sites such as the specific view based on permission level, making sure forms and sign ins work.

RSpec is a unit test that is a testing framework for Ruby. It is supposed to makes writing tests much more simple for developers. You write the test before you write your actual code to make sure you get the specific results that you want.

It is important bc it helps you write specific codes to get specific results you are intending.
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
context and describe are literally the same thing. The reason to use both is to make the test more readable. Both describe and context are testing to say there was rooms/beds available for tenants.
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
Entity Relationship Diagram (ERD) is a tool used to visual the relationships of
****items****
It also describes the data relating to the major entities that will exist in the programs. The arrows, circles and other characters are keys to show the type of relationships.

Using the person as the one-to-many example:
                  ___________
                  | Person  |
                  -----------
                  |        |      
               friends   posseses
                with        &
                PET       rubs     
                          LAMP  --------> GENIE
                                      Lives in a lamp & grants 3 wishes to person who rubs it's lamp


Genie lives in lamp
grants wishes to person
```

### Question 7

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema is used in databases to show the databases information. It gives information such as each tables column name their data type and any constraints, or rules, for the columns.

one to many: An entity that has many relationships


CREATE TABLE people (
  id SERIAL PRIMARY KEY,
  name TEXT,
  current city TEXT,
  age INTEGER
);

CREATE TABLE wishes (
  id SERIAL PRIMARY KEY,
  wish number INTEGER
  wish TEXT
  wisher_id INTEGER
);

In model:

class Wishes < ActiveRecord::Base
belongs_to :people
end

class People < ActiveRecord::Base
has_many :wishes
end
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
genie = Genie.create(name: "Genie")
genie_lamp = Lamp.create(wishes_remaining: "3")

2.
class Lamp < ActiveRecord::Base
  has_many :genies
end

class Genie < ActiveRecord::Base
  belongs_to :lamp
end

3.
genie_lamp.wishes_remaining
genie_lamp.wishes_remaining = "1"
genie_lamp.save

4.
jafar = Genie.new(name: "Jafar")
jafar.save

jafar_lamp = Lamp.new(wishes_remaining: "3")
jafar_lamp.save

5.
Lamp.destroy_all
```

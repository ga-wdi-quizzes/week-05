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
def belleResident
  town[:residents].delete("Belle")
  town[:castle][:residents].push("Belle")
end
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
def friendship
  friends.each do |friend|
    puts "Belle is friends with #{friend}"
end
```

## TDD and RSpec

### Question 4

Describe the differences between unit and functional testing. What type of testing is RSpec and why?

Your answer:
```text

Unit testing tests the functionality of a program at the smallest level.  In other words, it tests the functionality of individual methods.  Functional testing tests the program at a higher scope and incorporates a more user-story focus.

Rspec is a testing framework that executes unit testing.  Its tests focus on testing whether certain objectives are met by the methods of a program.
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

Both "describe" and "context" do the same thing in rspec; they provide organization to the structure of the tests. They can be nested within each other, but they don't affect the code.  It helps to add some visual context to the method being tested.
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
ERD stands for entity relationship diagram.  An ERD provides a means to visualize the relationship between data of various classes. Specifically, it shows entities and tables in a database and the relationship between those tables.  Creating ERDs helps plan out the structure of our data.

For the above entities:

Genie
attributes: name, outfit, location,
relationships: a genie has at least one lamp (maybe more?)

Lamp
attributes: material, color, size, weight
relationship: lamps belong to genie, but I don't think they belong to multiple genies.

Person
attributes: age, name, city of residence, etc.
relationships: a person can own one or multiple pets

Pet
attributes: breed, age, color
relationships: A pet usually belongs to a single person (owner)

```

### Question 7

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema defines what columns a particular table in a database will have.  It may specify the column name and data type allowed in that particular column.

In a SQL database, tables that have a one-to-many relationship are represented by keys with unique values.  In the people table, each unique person would have a unique ID.  In the wishes table, since wishes belong to people, there would be an additional column with the ID of ther corresponding person.
```

### Question 8

**Assume:**
1. Your database two working tables, `genies` and `lamps`.
2. You have a working connection to the database for ActiveRecord.
3. You have active record models defined for `Genie` and `Lamp`, and the
relationships between the two are set up in Active Record.
<!-- Do we want to specify what kind of relationship they have, in case some students aren't familiar with the mythology...? -->
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

lamp = Lamp.create(wishes_remaining: 3)
genie = Genie.create(name: "Genie")

2.

class Genie < ActiveRecord::Base
  belongs_to :lamp
end

3.

lamp.update(wishes_remaining: 1)

4.

jafar = Genie.create(name: "Jafar")
lamp_new = Lamp.create(wishes_remaining: 3)

5.

lamp.update(nil)

```

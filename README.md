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
  puts "Would you take this rose and help out
  an old beggar, #{person}?"
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
belle = town[:residents][1]
town[:castle][:residents] << ", " + belle




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

Unit tests cover small blocks of code, testing with specific inputs to look for specific outputs. These are developer level tests to help find bugs and ensure our refactors have no surprises.

Functional tests are designed for user interaction. They cover DOM-related issues like navigation (ex: link clicks) and listener events (ex: button clicks).

RSpec is a unit testing framework. It helps developers write tests for our small blocks of code with an easy to read and write syntax.
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

The describe and context tokens actually do the same thing. They are both to make the tests easier to read and understand for the programmer. However, by convention, describe is typically used to talk about the specific object or method that is being tested and context is typically used to talk about the specific conditions of that test. In the example above, describe indicates we are talking about the Apartment and the method to add tenants. In the context block, the condition (when there is enough room for a tenant) is given.
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
And ERD is a tool programmers use to visualize and describe the relationships between data that will exist in our programs. We create them to better plan out our database table structure before we begin to program. It does not describe behaviors of the items, just the attributes and relationships.

Person:
- name
- has pets
- has a lamp

Pet:
- name
- species

Lamp
- color
- has a genie

genie
- name
- number of wishes available
```

### Question 7

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A scheme in an SQL database is a blueprint for defining the columns a table will have. For each column it includes the column's name, the column's data type, and any constraints or rules that might be needed for that column.

To represent a one-to-many relationship in an SQL database, we create a column that can be used to join the two tables together. Example:

people
-id
- name

wishes
- id
- the_wish
- people_id

From there, we can call the following:
SELECT * FROM wishes JOIN people ON wishes.people_id = people.id;

This will connect the two tables via their shared column and allow us to search through the one-to-many relationship.
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
# code here
```

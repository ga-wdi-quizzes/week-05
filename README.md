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

def offer_rose (person)
  puts "Would you take this rose and help out an old beggar, #{person}?"
end

offer_rose("young prince")

# The output of offerRose is `nil`, while the side effect is the `puts` statement
# By convention, Ruby methods are defined using snake case (e.g, `offer_rose`) instead of camel case, as illustrated in the question

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

#remove Belle from the town residents

town[:residents].delete("Belle")

# add Belle to the list of guests in the castle

town[:castle][:guests].push("Belle") # or we could use the shovel operator

town[:castle][:guests] << "Belle"

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

friends.each { |friend| puts "Belle is friends with #{friend}."  }

```

## TDD and RSpec

### Question 4

Describe the differences between unit and functional testing. What type of testing is RSpec and why?

Your answer:
```text

Unit tests are narrowly focused, which means that each test checks the functionality of a specific method. Functional testing, on the other hand, is concerned with checking functionality on the level of user interaction (e.g., testing a submission form or log-in functionality). Thus, functional testing is often the main component of user acceptance testing (UAT), wherein an end user may check to see if each feature documented in the functional requirements works as expected.

RSpec is used for unit testing, because RSpec tests are written for individual methods on a Ruby class or object. RSpec is important in Test-Driven Development (TDD) in Ruby, because it allows the programmer to write methods one-by-one in order to check each method against its corresponding specification(s).

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

Functionally speaking, RSpec does not differentiate between `describe` and `context`; however, they are important for ensuring that tests are readable and intelligible to someone reviewing the specifications. It is important to note that neither `describe` nor `context` are used in actual tests, which follow this format: `it [string] do [some code] end`.

In the tests of the `Apartment` class as illustrated above, we see that `describe "#add_tenant"` is the description of the`.add_tenant` method, which is the specific method being tested. On the other hand, `context` includes a test of the `.add_tenant` method only when the apartment object has enough beds for and additional tenant. In sum `describe` indicates what is being tested (viz., the `add_tenant` method), and `context` indicates a specific circumstance *when* that method is being tested.

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

An ERD is an "Entity Relationship Diagram," which means that it is a visualization and description of the data relating to the major entities that will exist in a given program. ERDs allow us to plan out and ultimately create the table structure in an application's database.

Entities in an ERD may have a number of different kinds of relationships, and these relationships are commonly indicated using an arrow and open or closed circle. "One-to-many" means that a single entity may have many of another type of entity, (e.g., a "Person" entity may have many "Pet" entities). "One-to-one" means that a single entity may only have one of another type of entity (e.g., a "Genie" entity may belong only to one "Lamp" entity, and each lamp may have only one genie). "Many-to-many" means that an entity may have multiple other entities, and those other entities may belong to multiple other entities (e.g., A "Genie" entity may belong to multiple "Person" entities over time, and a "Person" entity may have multiple "Genie" entities at any given time).

```

### Question 7

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
Every application will have a database that will likely include multiple tables, each of which will store similar data. Every table will also have a schema, which defines which columns that table will include as well as the following information about each column: (1) the column's name, (2) the column's data type, and (3) any constraints or rules for the column. Together, the schemata for the tables constitute the database's schema.

Below is an example of how to define a schema for people and wishes in a SQL database. Note that each person has multiple wishes, but a given wish can only have one person (i.e., the relationship between the two tables is one-to-many).

DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS wishes;

CREATE TABLE people (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
);

CREATE TABLE wishes (
  id SERIAL PRIMARY KEY,
  wish_content TEXT NOT NULL,
  people_id INT NOT NULL
);

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
#1
genie = Genie.create(name: "Genie")
lamp = Lamp.create (wishes_remaining: 3)

#2
lamp.update(genie: genie)

#3
lamp.update (wishes_remaining: 1)

#4
jafar = Genie.create(name: "Jafar")
new_lamp = Lamp.create(wishes_remaining: 3)
new_lamp.update(genie: jafar)

#5
genie.update(lamp: nil)

```

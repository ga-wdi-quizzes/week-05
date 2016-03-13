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
  p "Would you take this rose and help out
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
town[:castle][:guests] << town[:residents].delete("Belle")

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
  p "Belle is friends with #{friend}"
end
```

## TDD and RSpec

### Question 4

Describe the differences between unit and functional testing. What type of testing is RSpec and why?

Your answer:
```text
Unit testing is intended to address program functionality at a specific method. Functional testing is more widely focused and intends to address program functionality with respect to the user, e.g. submitting information through a website, clicking links, etc
RSpec is a type of unit testing specific to ruby. It helps the developer to ensure that individual methods are working in their program.
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
'Describe' and 'Context' have the same affect on the RSpec tests but are semantically different. Context typically addresses the different contingencies in an if statement while describe relates to an entire method or object. Here 'describe' is used to relate the test to an object labeled 'Apartment' and the method 'add_tenant' contained within that object. 'Context' is used to relate the contingency when there is less than or equal to a certain number of beds in the apartment to make sure the method works appropriately in that scenario.
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
An Entity Relationship Diagram, or ERD, is a visualization of the major entities of a program. These entities are relatable on a 'parent-child' basis, where a parent and child can exist on one-to-one, one-to-many, or many-to-many basis. ERD's are used to plan out structure for large databases and to show which entities of a program belong where. A person or many people (parent) could find one or many lamps (child) (many-to-many). For the sake of this problem, let's assume that genie lamps are rare and that one person (parent) found one lamp (one-to-one). In this lamp (parent) there would be one genie (child) inside of it (one-to-one). 'Pet' would not belong in the ERD since this is a behavior performed by the person to summon the genie.
```

### Question 7

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema is the code that defines the makeup of columns in a table. A schema for an individual column includes the name of the column, the expected data type within that column, and any constraints on the data within that column. We can represent a one-to-many relationship in an SQL database by creating separate tables and linking them based on an ID identifier. For instance, we could create a table titled 'people' that includes a person's ID number, name, and other attributes about that person. Then in a different table titled 'wishes' we could make columns that include that description of the wish and an column specifying which person that wish belongs to (typically by the ID number that corresponds to the person in the people table). This way we could list all the wishes made by all people but provide the link of who made each wish.
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
lamp = Lamp.create(wishes_remaining: 3)
genie = Genie.create(name: 'Genie')
lamp.update(genie: genie)
lamp.update(wishes_remaining: 1)
jafar = Genie.create(name: Jafar)
lamp2 = Lamp.create(wishes_remaining: 3)
lamp2.update(genie: jafar)
genie.update(lamp: nil)
```

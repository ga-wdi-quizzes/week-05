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

def offerRose (person)
puts "Would you take this rose and help out an old beggar, #{person}?"
end  

offerRose(young prince)

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
town[:residents].delete("Belle")
town[:guests] = "Belle"
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

friends.each do |name|
puts "Belle is friends with " + name  
end

```

## TDD and RSpec

### Question 4

Describe the differences between unit and functional testing. What type of testing is RSpec and why?

Your answer:
```
Unit tests test a specific method. It makes sure specific inputs result in specific outputs. For example, if the user's phone number should always include numbers, then you may create a unit text on that method to make sure the output always has a float as its output. otherwise the test will fail. These smaller test are more important than the larger tests such as functional.

Functional testing focuses on a much larger scope and is good for the overall function such as site/database permission. Functional tests can also execute and modify the state of the system you are testing you must be careful.

Rspec allows you to write specifications about your code and test them. Rspec is Ruby's testing framework that makes it easier to write tests.

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
describe and context are typically the same in the sense that there's no functional difference but how they are used allows the tests to be more understandable. The purpose of describe is to wrap a set of tests against one functionality. It's usually at the top level. I like to think of it as the introduction to a text like its name or description.

context wraps a set of tests  under describe that wraps a text for methods under the same state. I think of this as a unique instance to the top level test. For example,

you will DESCRIBE "greeting" as the title and the context is how you will greet if in english specifically. It's still related to greeting but it's a specific context of the greeting that needs to be tested.
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
An ERD is an Entity Relationship Diagram that shows a visual relationship  between the major components that exist within our database. It allows us to plan out its structure and to see how things relate along with its dependencies.


For the example above, first we have to see how these things relate and what is dependent upon the other.

I would put the dependencies in order as follows:

Lamp ---->
Genie----> (the Genie needs the lamp and the lamp needs the genie. But without the genie, the lamp would have no powers)
Person----> The lamp is dependent upon a person to find it and rub it for it to work.
pet----> The pet is not needed in this diagram at all but the person could need the pet but it's not needed for the lamp to manifest it's powers through the genie and person.
```

### Question 7

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema is the organization or structure of a database. It's how objects relate to each other within a structure. We have experienced this in class with tables in Active Record of classes we defined. For example, Table (class) name is Students and each student has its own row with its age, nationality, major, and year as the tables columns.


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

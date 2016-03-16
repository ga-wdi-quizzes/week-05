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
town[:castle][:guests] << town[:residents][1]
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

Unit testing checks the functionality of a specific method at the smallest level – basically to make sure a specific input leads to a specific output. Functional testing has a wider focus, for things like form submission and making sure that users have appropriate access to pages based on their admin privileges, etc. RSpec testing seems to be mostly unit testing, but it can incorporate both unit and functional testing – unit testing always comes first, and is more critical.
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

'Describe' and 'context' technically have no difference when it comes to the code - they do the exact same thing, which is to help organize tests. The difference is really from an English-readable standpoint - describe is used to talk about a specific method or object. In this case, it's about the class Apartment. Context does exactly what it says - it talks about different contexts in which to test the Apartment class. Here, it's when there are two tenants with room for a third. However, if we were to use all 'describe' or all 'context', or invert the way they're used here, the tests would work the exact same way - it would just be harder for others to follow what's being tested.
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
An ERD is an Entity Relationship Diagram, and serves as a tool to help us describe the data / attributes related to the major entities that will exist in our programs. They also ultimately help us plan out and create our table database structure.  

For these entities, a lamp might be at the top of the schema, and for each lamp, there is exactly one genie, but many potential people who maybe possess the lamp for three wishes.

Pet isn't an entity in the schema – it's possible that a pet could be one of the three wishes a person asks the genie for, but that would be an attribute, not an entity.
```

### Question 7

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema is an example of one way to visually represent an Entity Relationship Diagram – the one-to-many relationship is illustrated by arrows on the lines between the entities. If there is an arrow on just one side of the line, that indicates that the side with the arrow has more than one / many. If there is an arrow on both sides, that illustrates a many-to-many relationship. Each person gets three wishes, so that would be a one-to-many relationship.
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
1. lamp = Lamp.create(wishes_remaining: 3)
genie = lamp.genie.create(name: "Genie")

2. class Lamp < ActiveRecord::Base
  has_one :genie
end

class Genie < ActiveRecord::Base
  belongs_to :lamp
end

3. lamp.update(wishes_remaining: 3)

4. evil_lamp = Lamp.create(wishes_remaining: 3)

jafar = evil_lamp.genie.create(name: "Jafar")

5. lamp.destroy

```

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
town[:residents] - ["Belle"]
town[:castle][:guests] << "Belle"
```

Using Ruby, remove Belle from the town residents, and
add her to the list of guests in the castle.

Write your code here:
```ruby
# code here
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
friends.each { |friend| puts "Belle is friends with #{friend}}"
```

## TDD and RSpec

### Question 4

Describe the differences between unit and functional testing. What type of testing is RSpec and why?

Your answer:
```
Unit testing tests the smallest level of the code, or the functionality of specific methods and blocks of code.
Functional testing has a broader scope in that it tests to make sure that user interaction is working properly.
Rspec is a domain specific language framework that uses unit testing. When the rspec tests pass it demonstrates that the app features are complete and written correctly with few to no bugs!
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
The purpose of describe is to wrap the tests against the Apartment functionality, whereas the purpose of context is also to wrap the test against the Apartment functionality under the state of "when there is a room". In essence, they both wrap tests but context is more specific, which makes it easier for programmers to read tests and understand their individual behaviors.
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
An entity relationship diagram (ERD) is a tool that programmers use to  create, and describe data structures and their relationships. We create them for applications to be able to visualize and plan out the entity structures' attributes and actions.

Using the example above, a Genie and Person serve as the relationship of an entity to a Lamp and Pet, respectively. In terms of how these relationships would be mapped on an ERD diagram, one could say that a Person can have many pets but a pet can not have more than one person. In this context, the Person provides the overall scope for which the pet is contained. In the Genie example, since the Genie can pop out of and go inside a lamp, a diamond shaped box would be used in an ERD diagram to describe the action of the Genie in relation to the lamp.
```

### Question 7

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema is the blueprint of how the database is constructed. One purpose of a schema is to specify how the facts that are inputted into the database apply to the end users. A one-to-many relationship is diagrammed in a SQL database by having two separate (rectangular) entities connected by one (diamond) relationship in a 1:N format. The '1' represents the one instance associated with the relationship, and the N represents more than one instance associated with a relationship. In this case, people can have more than one wish, but wishes cannot have more than one person. Therefore, 1 would be on the people side and wishes would be on the N side.
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
<!-- 1. Create a lamp with 3 wishes remaining and a genie named 'Genie' -->
lamp = Lamp.create(wishes_remaining: 3)
genie = Genie.create(name: "Genie")

<!-- 2. Create a relationship between 'Genie' and the lamp. -->
class Genie < ActiveRecord::Base
has_one :genie
end
class Lamp < ActiveRecord::Base
belongs_to :lamp
end

<!-- 3. Update the lamp so it only has one wish left. -->
lamp.update(wishes_remaining: 1)

<!-- 4. Create a new Genie named 'Jafar' and put him in a new lamp with 3 wishes left. -->
jafar = Genie.create(name: "Jafar")
jafar_lamp = Lamp.create(wishes_remaining: 3)
jafar_lamp.update(genie: jafar)

<!-- 5. Free the good Genie by setting his lamp to `nil` -->
genie.update(lamp: nil)

```

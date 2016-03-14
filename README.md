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
def offerRose person
    puts "Would you take this rose and help out an old beggar, #{person}?"
end
offerRose "young prince"
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
friends.each do |friend|
    puts "Belle is friends with #{friend}"
end
```

## TDD and RSpec

### Question 4

Describe the differences between unit and functional testing. What type of testing is RSpec and why?

Your answer:
```text
Functional tests are written with the user in mind, to test pieces of functionality.

Unit tests are written to test each method of the program written by the developer, to
assure it produces the expected output based on its input.
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
Here, `describe` is used to specify classes and methods, where `context` is used
to specify a condition within a method to run tests against.
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
An ERD is a modeling technique to show the objects/entities of a data system
and the relationships between those objects.

A person might have a name, age, or any other human attribute.

A person may or may not have a pet, which is dependant on having a person as
its owner.  A pet might have a name, species, etc.

A lamp might belong to a person, but without knowing if it's a magic lamp
(see Genie) it would be simply classified as an object of furniture that's
also a member of a room, which is a member of a building, or the data might
not need those classifactions.

A Genie could be a type of person that has magical powers.  A genie could
also be a property of a magic lamp, which might be a property of a non-magical
person.

```

### Question 7

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema is the structure and relationships of data layed out as instructions for
how to build a particular database.

One-to-many relationships can be constructed by sharing an id number of the object
that has many other objects.

person: person_id, name, age
wishes: wish_id, description, person_id
```

### Question 8

**Assume:**
1. Your database two working tables, `genies` and `lamps`.
2. You have a working connection to the database for ActiveRecord.
3. You have active record models defined for `Genie` and `Lamp`, and the
relationships between the two are set up in Active Record.
<!-- Do we want to specifiy what kind of relationship they have, in case some students aren't familiar with the mythology...? -->
<!-- I say yes. Googling the rules of genie/lamp relationships in the scope of Aladdin (a film I last saw when I was 10) seems to distract from the exercise while feeling left in the dark, and so I'm just guessing it can only ever be a one-to-one relationship.-->
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
initial_wishes = 3
some_lamp = Lamp.create(wishes_remaining: initial_wishes)
good_genie = Genie.create(name: "Genie")
some_lamp.update(genie: good_genie)
some_lamp.update(wishes_remaining: 1)
jafar = Genie.create(name: "Jafar")
jafar_lamp = Lamp.create(wishes_remaining: initial_wishes, genie: jafar)
good_genie.update(wishes_remaining: nil)
```

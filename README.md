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
  puts "Would you take this rose and help out an old beggar, " + person + "?"
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

town[:residents].delete "Belle"
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

friends.each {|name| puts "Belle is friends with #{name}"}

```

## TDD and RSpec

### Question 4

Describe the differences between unit and functional testing. What type of testing is RSpec and why?

Your answer:
```text

In this context "units" are individual pieces of code and the "function" is the desired activity that you're hoping your code performs. So unit testing will check that the individual pieces are doing their jobs - this is what RSpec does. Functional testing makes sure the program is meeting the requirements established out the outset (i.e., the point of the program). Unit tests can change/evolve during the course of creating the program depending on the tactics used. Functional tests generally do not change over the course of the project.

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

describe is a key word that indicates the test will engage with a specific class or method. context is a keyword that indicates the test will examine the behavior of the method under a certain condition.

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

An ERD, aka an entity relationship diagram, is a graphical representation of how database tables are related to one another. ERBs are useful tools for ensuring that we understand our database and that we are establishing relationships correctly.

In the given example  - assuming we want relationships between all four things (Aladdin did have a monkey) - there would be one genie pointing at one magic lamp (since there can only be one genie in a magic lamp at a time, obvs) and pointing at the person. The lamp would also be pointing at the person, indicating that the lamp can have one owner and that the person who owns the lamp controls the genie (the genie and the persons would be pointing at each other). The person would also be pointing at a table for pets indicating that a person can have multiple pets and that pets can only have one owner (holding aside entirely outdoor cats which I've heard often have multiple owners).

```

### Question 7

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema describes the way a User is related to all the tables in a database that have some relationship with that User. A one-to-many relationship would have a User (here "person") with an id that would be shared among many wishes, and each wish would only reference one person_id.

person: person_id, first_name, last_name
wish: wish_id, wish_description, person_id

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
genie = Genie.create(name: "Genie")

lamp.update(genie: genie)

lamp.update(wishes_remaining: 1)

jafar = Genie.create(name: "Jafar")
jafars_lamp = Lamp.create(wishes_remaining: 3)
jafars_lamp.update(genie: jafar)

genie.update(lamp: nil)


```

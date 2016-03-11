# Week 05


## Ruby Basics & Enumerables (meets Beauty and the Beast)

### Question 1

Define a method called `offerRose`, which should take one argument named person.

When called, the method should `puts`, "Would you take this rose and help out
an old beggar, X?", where X is the person passed into the method.

Demonstrate calling the method with an argument of "young prince".

Write your code here:
```ruby
def offerRose (person)
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
belle = town[:residents].delete "Belle"
town[:caslte][:guests].push belle
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
  puts "Belle is friends with {#{friend}}"
end

```

## TDD and RSpec

### Question 4

Describe the differences between unit and functional testing. What type of testing is RSpec and why?

Your answer:
```text
Unit tests check the smallest level or one method of code. Functional tests have a wider focus, such as testing to see if a sign-in form works. RSpec is a testing framework for Ruby that does Unit tests.
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
Context and describe do the exact same thing. The only reason there are two words to describe the exact same thing is for readability. Describe can be used to talk about specific objects or methods, and context can be used to describe the context.
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
An ERD stands for Entity-Relationship Diagram. It describes the relationship between data in a database table.

Genie
 - name
 - has_many lamps

 Lamp
 - has_one genie
 - genie id

 ------------
 Person
 -name
 -age
 - has_many pets

 Pet
 -name
 - has_one person
 - person id


```

### Question 7

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema is a container for all the objects inside a table, like the rows and columns. A one-to-many relationship is when you have many instances that belong to one instance. For example:

wishes
- has_one person
- type_of_wish

people
- has_many wishes
- wish ID
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
1. genie = Genie.create(name: "Genie")
   lamp = Lamp.create(wishes_remaining: 3)
2. lamp.update(genie:genie)
3. lamp.update(wishes_remaining: 1)
4. jafar = Genie.create(name: "Jafar")
  jafar_lamp= Lamp.create(wishes_remaining:3)
  jafar_lamp.update(genie:jafar)
5. genie.update(lamp:nil)

```

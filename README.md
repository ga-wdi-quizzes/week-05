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
belle = town[:residents].delete "Belle"
town[:castle][:guests] << belle
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

Unit tests ensure that a method/function you have written works the way that it is intended to. It typically tests one method at a time A functional test ensures that the entire program works the way a user would expect it to. RSPEC is unit testing because we looked at each method individually and write tests to ensure that that specific method gives an output/ works!
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
Describe provides information of what is being done-- ex. here is that the method describes adding a tenant to the apartment. Context explains the conditions for that method, in this example explaining that the tenant can be added only if there are enough beds, which is up to 3.  
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
An ERD is an Entity Relationship Diagram. Its purpose is to demonstrate how data relates to other data in records. We create them in applications in order to show how attributes of one piece of data or one table might compare to data in another table, and we are able to connect the tables through common records.  

With the entities above, a lamp would belong to a person, and a person could have multiple lamps, but a lamp would only belong to one person. The lamp could create a genie and the genie comes out of the lamp, and thus relates to the peron. The same goes for the person and the pet-- a person might have multiple pets, but a pet (typically) belongs only to one person.  The four might all relate because the same person could have both a lamp, which creates a genie, and a pet.
```

### Question 7

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema explains what data, tables and records belong in a database, including what the tables are, how they relate and attributes each of the tables have. for instance, a person might have an id, name, and number of wishes-- it may have multiple wishes, but a wish table might have columns for the each wish's id, the id of the person the wish belongs to, what the wish is, and if it has come true.  The wish belongs only to one person, so you would include that person's id in the wish table in order to relate them in the database.  
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
1.
lamp = Lamp.create(wishes_remaining: 3)
genie = Genie.create(name: 'Genie')
2. #lamp will belong to the genie
  lamp.update(genie: genie)

3. lamp.update(wishes_remaining: 1)
4.
jafar = Genie.create(name: 'Jafar')
jafarlamp = Lamp.create(wishes_remaining: 3)
jafarlamp.update(genie: jafar)

5. genie.update(lamp: nil)

```

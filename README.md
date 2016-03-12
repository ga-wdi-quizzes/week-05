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
    puts "Would you take this rose and help out and old beggar #{person}"
end

offerRose("Young Princess")
offerRose("Young Prince")
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
#if town includes belle reject it.
belle = town[:residents].find {|person| person.eql?("Belle")}

town[:castle][:residents] + " and " + belle

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
friends = ["Chip Potts", "Cogsworth", "Lumière", "Mrs. Potts"]
friends.each do |friend|
    puts "Belle is friends with #{friend}"
end
```

## TDD and RSpec

### Question 4

Describe the differences between unit and functional testing. What type of testing is RSpec and why?

Your answer:
```text

Functional testing test the bigger picture/end user interactions with the app. These test click on links and go to webpages.
Unit testing, like RSpec, do small test. They test small chunks of code like a method in a class.  
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

describe and context do the same thing. They visually lump tests together into blocks. It makes it visually easier to read for humans in English. For us it was easy to use "describe" for explaining a what a method does and "context" for things inside that method like the if/elsif part of the method.
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
ERD stands for entity-relationship diagram and is a tool used to visualize and describe data relating to major entities that will be in a program or organization.

A Person can have many pets (or genies). A pet might have many owners but can have one owner(person). A genie only has one owner(person) and lives in only one lamp.

In the case of Aladdin, it seems to be a convention to have a one to one human to pet relationship. ie Aladdin had one monkey, Jasmine had one tiger, Jafar had one parrot and vice versa. Geanie could have only one owner at a time but through out the movie he had many owners...

```

### Question 7

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema is the code version of an ERD in that it describes the relationships of the major entities and the data in the tables. You are able to load the code into your database by running a command.

In a file we would:
CREATE TABLE kids (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  birth_date INTEGER
);

CREATE TABLE wishes (
  id SERIAL PRIMARY KEY,
  content VARCHAR(255),
  kid_id INTEGER
);

By putting the kid_id if the wishes table we can give a kid many wishes.
```

### Question 8

**Assume:**
1. Your database two working tables, `genies` and `lamps`.
2. You have a working connection to the database for ActiveRecord.
3. You have active record models defined for `Genie` and `Lamp`, and the
relationships between the two are set up in Active Record.
<!-- Do we want to specify what kind of relationship they have, in case some students aren't familiar with the mythology...? -->
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
#This is confusing. Lamps don't have wishes, people do.
lamp = Lamp.create(wishes_remaining: 3)
lamp.genies.create(name: "Genie")
jafars_lamp = Lamp.create(wishes_remaining:3)
jafars_lamp.genies.create(name: "Jafar")
lamp.update(wishes_remaining: nil)



#this makes more sense to me.
aladdin = Human.create(name: "Aladdin", wishes_remaining: 3)
Genie.create(name: "Genie", human: aladdin)
#Jafar takes genie from Aladdin so aladdin has no more wishes.
aladdin.update(wishes_remaining: 0)
jafar = Human.create(name:"Jafar", wishes_remaining: 3)
genie = Genie.find_by(name: "Genie")
genie.update(human: jafar)

#jafar becomes a genie
genie.update(human: nil)
jafar.destroy
Genie.create(name: "Jafar", human: aladdin)




```

# Week 05

## Instructions

1. Fork this repo
2. Clone your fork
3. Fill in your answers by writing in the appropriate area, or placing an 'x' in
the square brackets (for multiple-choice questions).
4. Add/Commit/Push your changes to Github.
5. Open a pull request.

**Note**: Only place your answer between backticks. Don't modify the backticks,
or the language specifier after them.

## Ruby Basics & Enumerables (meets Beauty and the Beast)

### Question 1

Define a method called `offer_rose`, which should take one argument named `person`.

When called the method should `puts` "Would you take this rose, `person`, in exchange for giving an old beggar woman shelter from the bitter cold?"

Demonstrate calling the method, passing in "young prince" as the argument.

Answer:
```ruby
def offer_rose(person)
  puts "Would you take this rose, #{person}, in exchange for giving an old beggar woman shelter from the bitter cold?"
end

offer_rose "young prince"
# Would you take this rose, young prince, in exchange for giving an old beggar woman shelter from the bitter cold?
# => nil
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

Answer:
```ruby
belle = town[:residents].delete("Belle") #=> "Belle"
town[:castle][:guests].push(belle)
```

#### References

[Array#delete](http://ruby-doc.org/core-2.2.0/Array.html#method-i-delete)

- Deletes all items from self that are equal to obj.
- Returns the last deleted item, or nil if no matching item is found.

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

Answer:
```ruby
friends.each { |f| puts "Belle is friends with #{f}" }
```

## TDD and RSpec

### Question 4

Describe the differences between unit and functional testing. What type of testing is RSpec and why?

Answer:
```yaml
unit_testing:
  - written from a programmers perspective
  - to ensure that a particular method (or a unit) of a class performs a set of specific tasks

functional_testing:
  - written from the user's perspective
  - to ensure that the system is functioning as users are expecting it to
```

#### References
- [Unit tests vs Functional tests](http://stackoverflow.com/a/2741845/3837223)

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

Answer:
```text
context does literally the exact same thing as describe. They're identical.
RSpec makes no difference between them.
To make your tests more readable from an English standpoint.
We can use describe for specifying objects or methods that are to be tested.
We can use context for specifying different contexts that method is used.
The net effect is to be able to write spec example like English for its readability.
```

#### References
[ga-wdi-lessons/rspec](https://github.com/ga-wdi-lessons/rspec#we-do-additional-tests-using-context-5-min)

## SQL, Databases, and ActiveRecord (meets Aladdin)

### Question 6

Describe what an ERD is, and why we create them for applications. Also give an
example what the attributes and relationships might be for the following
entities (no need to draw an ERD):
* Genie
* Lamp
* Person
* Pet

Answer:
```
An Entity Relationship Diagram (ERD) is a tool we use to visualize and describe the data relating to the major entities that will exist in out programs.
It is useful in our planning an application and its database table structure.
Also, it help other developers understand the structure of the whole application.

E.g., one-to-many
- Person can have many pets.
- Pet can belong to one person.
```

### Question 7

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Answer:
```
A database schema defines how the data is organized and how the relations among them are associated.
If we have people and wishes tables in a database and they have one-to-many relationship,
we can say that each person can have many wishes and each wish belongs to one person.
In our database, those two tables are linked through the foreign key person_id in
the wishes table.
```

#### References
[DBMS - Data Schemas](http://www.tutorialspoint.com/dbms/dbms_data_schemas.htm)

### Question 8

**Assume:**  

1. Your database two working tables, `genies` and `lamps`.  
2. You have a working connection to the database for ActiveRecord.  
3. You have active record models defined for `Genie` and `Lamp`, and the
relationships between the two are set up in Active Record.  
4. Lamps have one property, `wishes_remaining`, and genies have one property, `name`.  

**Write code to do the following:**

1. Create a lamp with 3 wishes remaining and a genie named 'Genie'
2. Create a relationship between 'Genie' and the lamp.
3. Update the lamp so it only has one wish left.
  * Oh no... Jafar has Aladdin! Thankfully he's wished to become a genie himself!
4. Create a new Genie named 'Jafar' and put him in a new lamp with 3 wishes left.
5. Free the good Genie by setting his lamp to `nil`


Answer:
```ruby
# Disclaimer: I am not familiar with this story; thus I assume such one-to-many
# relationship that one lamp has many genies so that I can start working on this exercise.
lamp = Lamp.create!(wishes_remaining: 3)
lamp.genies.create!(name: "Genie")
lamp.update(wishes_remaining: 1)
another_lamp = Lamp.create!(wishes_remaining: 3)
lamp.genies.create!(name: "Jafar")
# ???
```

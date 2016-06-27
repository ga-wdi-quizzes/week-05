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

Write your code here:
```ruby
def offer_rose(person)
  puts "Would you take this rose, " +  person + ", in exchange for giving an old beggar woman shelter from the bitter cold?"
end

offer_rose(young_prince)
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
town[:residents] -= ["Belle"]
town[:castle][:guests] += ["Belle"]
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
# code here
friends.each do |friend|
   puts "Belle is friends with #{friend}"
end
```

## TDD and RSpec

### Question 4

Describe the differences between unit and functional testing. What type of testing is RSpec and why?

Your answer:
```text

Unit testing tests specific components of a system, such as a method or function. For an HTML based word processor, 
we might perform unit tests on a bold method, and look to see if text in the <strohng></strong> tags, plus the 
proper CSS is output.

Functional testing is performed on larger pieces of the system. Again for a word processor, functional testing 
might involve selecting some text, typing CTRL-B, and seeing if it displays as bold. It might go on to test that 
the text stays bold if the file is saved, closed and re-opened, converted to a PDF, sentto a printer, etc. 

RSpec performs unit testing; it tests the functionality of individual classes and associated methods. 
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
Decscribe relates the test to specific pieces of code. In the above example, the first describe relates the 
rspec code to a class called Apartment, and the second further relates relates it to a method of that class 
called add_tenant. 

Context, however, provides an English language description tests, output as messages as the tests succeed or fail. 
```

## SQL, Databases, and ActiveRecord (meets Aladdin)

### Question 6

Describe what an ERD is, and why we create them for applications. Also give an
example what the attributes and relationships might be for the following
entities (no need to draw an ERD):
* Genie
* Lamp
* Person
* Pet

Your answer:
```
An ERD is an Entity Relationship Diagram displays the types of entities that will exist in a program and 
its associated databases. It shows the entities, the attributes of each entity, and how it related to other 
entities. It's a conceptual model that does not define solutions to a problem, but is used to plan and develop
solutions. 

For instance, a Genie might have attributes like an ID (an integer, assigned by the database) Name and CurrentShape, 
(text fields), Age (an integer), and LampID, the ID of a Lamp (aka a Foreign Key.).

A Lamp would have it's own ID, a Location (text field) and a GenieID, representing the ID of its Genie. This indicates
a one-to-one relationship between Genies and Lamps: each Genie had one Lamp, and each Lamp has one Genie. It would also
have a field for the ID of its owner. 

A Person might have an ID, a Name and a Location. They might have any number of Lamps, forming a one-to-many 
relationship, so they do not have a Lamp field; ownership of a Lamp is covered by Lamp's attributes. 

A Pet would have a name. If we assume a Person can have multiple Pets (a Crazy Cat Lady?) and a Pet can have multiple owners
(a family dog?), that's a many-to-many relationship. I'm not quite sure how that's represented from a database standpoint, 
beyond requiring a third table.
```

### Question 7

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
Each table in a database is defined by a schema. The schmea defines the columns in the table each row may have: 
the data type (for instance, string, integer, float, date), and any constraints (for instance, a limited range 
of numbers or making the field mandatory.) Among those fields can be foreign keys, that represent relationships to
other entities. There are three types of relationships: one to one, one to many and many to many.

A one to many relationship is shown by a column in the schema for the "many" data. For instance, a person can have
many wishes, so people to wishes is one to many. Each wish would have a person field in the schema, and it would contain
the ID of the person who made the wish. The person table has no direct listing of wishes; a given person's wishes can be found by searching the wishes table for that person's ID.
```

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


Write your code here:
```ruby
1)
  lamp = Lamp.new(wishes_remaining: 3)
  genie = Genie.new(name: "Genie")
2)
  genie.lamp = lamp
3) 
  lamp.wishes_remaining = 1
4)
  jafar_lamp = lamp.new(wishes_remaining: 3)
  jafar = Genie.new(name: 'Jafar', lamp: jafar_lamp)
5)
  genie.lamp = nil
```

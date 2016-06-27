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
  puts ("Would you take this rose, "+person+", in exchange for giving an old beggar woman shelter from the bitter cold?")
end

marasanders@Maras-MacBook-Air-2:~/wdi/quizzes/week-05  $ ruby test.rb

From: /Users/marasanders/wdi/quizzes/week-05/test.rb @ line 5 :

    1: require "pry"
    2: def offer_rose(person)
    3:   puts ("Would you take this rose, "+person+", in exchange for giving an old beggar woman shelter from the bitter cold?")
    4: end
 => 5: binding.pry
    6: puts ("")

[1] pry(main)> offer_rose("young prince")
Would you take this rose, young prince, in exchange for giving an old beggar woman shelter from the bitter cold?
=> nil
[2] pry(main)>
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


Write your code here:
```ruby

town[:residents].delete("Belle")
town[:castle][:guests] << "Belle"
or
belle = town[:residents].delete("Belle")
town[:castle][:guests] << belle

[6] pry(main)> town = {
[6] pry(main)*   residents: ["Maurice", "Belle", "Gaston"],  
[6] pry(main)*   castle: {  
[6] pry(main)*     num_rooms: 47,    
[6] pry(main)*     residents: "Robby Benson",    
[6] pry(main)*     guests: []    
[6] pry(main)*   }    
[6] pry(main)* }  
=> {:residents=>["Maurice", "Belle", "Gaston"],
 :castle=>{:num_rooms=>47, :residents=>"Robby Benson", :guests=>[]}}
[7] pry(main)> belle = town[:residents].delete("Belle")
=> "Belle"
[8] pry(main)> town[:castle][:guests] << belle
=> ["Belle"]
[9] pry(main)> town
=> {:residents=>["Maurice", "Gaston"],
 :castle=>{:num_rooms=>47, :residents=>"Robby Benson", :guests=>["Belle"]}}
[10] pry(main)>
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
  puts ("Belle is friends with #{friend}")
end

[8] pry(main)> friends = ["Chip Potts", "Cogsworth", "Lumière", "Mrs. Potts"]
=> ["Chip Potts", "Cogsworth", "Lumière", "Mrs. Potts"]
[9] pry(main)> friends.each do |friend|
[9] pry(main)*   puts ("Belle is friends with #{friend}")  
[9] pry(main)* end  
Belle is friends with Chip Potts
Belle is friends with Cogsworth
Belle is friends with Lumière
Belle is friends with Mrs. Potts

```

## TDD and RSpec

### Question 4

Describe the differences between unit and functional testing. What type of testing is RSpec and why?

Your answer:
```
Unit tests check the smallest level. The functionality of a specific method

The "units" in unit tests are individual methods. Unit tests are intended to test small, little blocks of code, and make sure a specific input results in a specific output.

Functional tests have a much wider focus. You'd use functional testing to make sure a sign-in form works, or that a user who doesn't have admin privileges can see this page, while a user who does have admin privileges can see that page.

Unit testing always should come before functional testing.

The goal of unit tests is that when all of the tests pass, your app is complete.

The way we have used rspec so far has been all unit testing - although I would imagine you could probably test admin privileges with it too which is part of functional testing.
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
Context does literally the exact same thing as describe. RSpec does not differentiate between one or the other you just use them to make your tests more readable.  Describe is used above because it is talking about specific objects and methods, and context is used to describe the circumstances that form the setting for an event, statement, or idea, and in the context of which it can be fully understood and assessed.
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
An ERD -- or "Entity Relationship Diagram" -- is a tool we use to visualize and describe the data relating to the major entities that will exist in our programs.

It helps us to plan out and create our database table structure.

each LAMP: ID, wishes_remaining - would have one GENIE: name - which might encounter many PEOPLE: each of those people might have many PETS: type, name, color

```

### Question 7

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
Each table has a schema, which defines what columns it has. For each column the schema defines...

The column's name.
the column's data type.
Any constraints for that column.

not sure what your looking for here but the idea is there are many wishes for each person so each wish would contain a foreign key that would be the persons id pointing to the primary key in people to connect it to the people table

CREATE TABLE people(
  id SERIAL PRIMARY KEY,
  name TEXT,
  nationality TEXT
);

CREATE TABLE wishes(
  id SERIAL PRIMARY KEY,
  wish TEXT,
  person_id INT
);
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
genie_lamp = Lamp.create(wishes_remaining: 3)
genie = Genie.create(name:"Genie",lamp: genie_lamp)
genie_lamp.wishes_remaining = 1
   would you need a genie_lamp.save? I assume that since it's a class method it is not needed
new_lamp = Lamp.create(wishes_remaining: 3)
jafar = Genie.create(name:"Jafar",lamp: new_lamp)
jafar.lamp = nil - I set up the whole model to see if this would work it did I thought you weren't allowed to do this? of course I did not set up NOT NULL in the schema but I thought that would be inherit for a foreign key I thought we learned that it was for a primary key.


```

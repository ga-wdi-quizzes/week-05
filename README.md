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

def offer_rose (person)
  puts "Would you take this rose, #{person} in exchange for giving an old beggar woman shelter from the bitter cold?"
end

offer_rose("young prince")

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
town[:castle][:guests]<< town[:residents].delete("Belle")
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

Unit testing allows us to test blocks code at the smallest, most granular level, method by method.
Functional testing has a wider focus, and is used to test the wider functionalities of a site (checking that a login page works, testing buttons, links, etc.)

Rspec is a domain specific language and testing framework that allows for unit testing ruby code.

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

Rspect does not distinguish any difference between context and describe. The point of having both is for human readability. Describe can be used for individual objects while context is used for a certain situation.

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
An ERD is an entity relationship diagram. An ERD looks like a flowchart and is used to visualize data and relationships between different data. It is  used to plan the structure of a App's database and how different data will interact.

Genie:
A Genie has a one-to-one relationship with lamp. A Genie has attributes like a name, certain powers, a nationality and an age.

Lamp:
A Lamp has a one-to-one relationship with its Genie. It's attributes might include: the material its made from, age, and origin.

Person:
A person has a one to many relationship with pets. Attributes include name, age, height, weight, blood-type, etc.

Pet:
A pet has a one to one relationship with its person. Attributes include species, age, health, food preferences, etc.

```

### Question 7

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
Every table in a database has a schema which outlines its columns, data types, and any constraints to the type of data it can include.

People have a one to many relationship with wishes, so each wish in the database will include a person_id to associate it with the corresponding person.

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
1. lamp = Lamp.create(wishes_remaining: 3), genie = Genie.create(name: "Genie")
2. genie.lamp = lamp
3. lamp.update(wishes_remaining: 1)
4. jafar = Genie.create(name: "Jafar")
jafar.lamp.create(wishes_remaining: 3)
5. genie.lamp.delete

```

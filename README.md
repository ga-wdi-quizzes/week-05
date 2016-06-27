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
#method defined
def offer_rose person
  @person = person
  puts "Would you take this rose, " + @person + ", in exchange for giving an old beggar woman shelter from the bitter cold?"
end
#method called
puts offer_rose("young prince")
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
@residents = town[:residents].delete_at(1)
@guests = town[:castle][:guests]
@guests.push("Belle")

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

Unit tests are individual tests executed. For a example, testing a method would be a unit test.
Functional testing tests a slice of functionality in a system. This would include many methods that may interact with dependencies such as databases.
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

describe and context do not have a functional difference, but have a contextual difference. The difference between them would be that describe is used to wrap a set of tests against one functionality, while “context” is to wrap a set of tests against one functionality under the same state.
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
ERD stands for Entity Relationship Diagram. They are created to have a clearer vision of the database structure of an application. They consist of the entities or classes of a database and its properties/attributes. In this case, Person could have a one-to-many relationship with the Pet entity. Rob could be the name of a person who has 2 pets. In the Pet entity, there could be an attribute "type" where it can specify that Rob owns a cat and a dog. The Genie could have a one-to-one relationship with the Lamp. Genie could have an attribute name as well which relates to the Lamp with an attribute called origin_name, where it says from which country the lamp originated.
```

### Question 7

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A database schema is the skeleton structure that represents the logical view of the entire database. It defines how the data is organized and how the relations among them are associated. A database schema defines its entities and the relationship among them.
To represent a one-to-many relationship in a SQL database, we can have a table called People and a table called Wishes.
People: person_id, first_name, last_name, wishes_count
Wishes: wishes_id, wishes_count, person_id
The person_id will be the foreign key where the two tables are related to each other.
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
lamp = Lamp.create(wishes_remaining: 3)
genie = Genie.create(name: "Genie")
genie.update(lamp.id: 1)
lamp.update(wishes_remaining: 1)
jafar = Genie.create(name: "Jafar")
second_lamp = Lamp.create(wishes_remaining: 2)
lamp = nil

```

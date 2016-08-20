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
  puts
end
"Would you take this rose" + offer_rose + "in exchange for giving an old beggar woman shelter from the bitter cold?"
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
town = {
  residents: ["Maurice", "Gaston"],
  castle: {
    num_rooms: 47,
    residents: "Robby Benson",
    guests: ["Belle"]
  }
}
```

### Question 3

Assume you have an array of strings representing friend's names:

```ruby
friends = ["Chip Potts", "Cogsworth", "Lumière", "Mrs. Potts"] interpolation, produce output (using `puts`) like so:

```
Belle is friends with Chip Potts
Belle is friends with Cogsworth
Belle is friends with Lumière
Belle is friends with Mrs. Potts
```
def
  "Belle is friends with" + "friends[0]" + "."
  "Belle is friends with" + "friends[1]" + "."
  "Belle is friends with" + "friends[2]" + "."
  "Belle is friends with" + "friends[3]" + "."
end
```


```

## TDD and RSpec

### Question 4

Describe the differences between unit and functional testing. What type of testing is RSpec and why?

Your answer:
```Unit tests test out individual units, such as class methods within a function. Functional tests are written with the user's perspecitve in mind; they conform that the system does what hte user expects it to do, from end to end.  RSpec is the defacto testing framework of Ruby. We use it to make it easier to write tests. Moreover, it is a Domain Specific Language (solves problems within a specific domain). We can write live specifications about our code with it.

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
```“Describe” wraps a set of tests against one functionality or method. “Context” wraps a set of tests against one function under the same state.
Replace this with your answer
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
``` An Entity Relationship Diagram a tool used to visualize data and describe the data relating to the major entities that will exist in a program. We use them to plan out the creation of database table structures. Data is isolated from behavior.
Person has_many Pets
Pet belongs_to person
Genie has_many Lamps
Lamp belongs_to Genie
Replace this with your answer
```

### Question 7

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
``` A schema is a ruby file that defines the structure of an application's database. ActiveRecord keeps the schema up-to-date each time we run rake db:migrate.
people has_many wishes
wishes belongs_to people
Replace this with your answer
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
class CreateLamp < ActiveRecord::Migration
  def new
    create_table :wishes do |t|
        t.string :wish_1
        t.string :wish_2
        t.string :wish_3
    end
  end
end

genie has_many wishes
wishes belongs_to genie

class CreateGenie < ActiveRecord::Migration
  def new
    create_table :genie do |t|
      t.string :name
      t.string :wine_type
    end
  end
end
==========
class CreateLamp < ActiveRecord::Migration
  def change
    create_table :lamp do |t|
        t.string :wish_1
    end
  end
end
==========
class CreateGenie < ActiveRecord::Migration
  def new
    create_table :Jafar do |t|
        t.string :wish_1
        t.string :wish_2
        t.string :wish_3
    end
  end
end

# code here
```

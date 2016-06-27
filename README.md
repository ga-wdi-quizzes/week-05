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
# code here
def offer_rose person
  puts "Would you take this rose #{person}, in exchange for giving an old beggar women shelter from the bitter cold?"
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
# code here
town[:residents] - ["Belle"]
town[:guests] << "Belle"
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
friends.each { |friend| puts "Belle is friends with #{friend}"}
```

## TDD and RSpec

### Question 4

Describe the differences between unit and functional testing. What type of testing is RSpec and why?

Your answer:
unit testing : checks code at the smallest level - focuses on the functionality of a specific method.
functional testing : a much braoder level of testing. focus on if the code performs tasks such completing specific user stories etc
RSpec is a type of unit testing
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
There is no difference between describe and context - they both just bunch together bits of code to test.
You would use context in addition to describe to make the testing more clear to the reader

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
```
ERD stands for entity relationship diagram. its a tool that basically enables us to visualize data
and the relationships between data. it helps us create tables in databases. Genie and Lamp would
have a one-to-one relationship. Genie would have a name as an attribute, and Lamp would maybe have
type or material as an attribute.
Person to pet could have a one-to-many relationship because one person can have many pets, but many people
generally couldnt share one pet. name would be an example of an attribute for both pet and person. another
attribute for pet would be type/kind
```

### Question 7

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
Replace this with your answer
a schema basically just outlines the columns for each table, so that you don't have to keep inputing all
the structural information of a table each time you add data.
we represent a one-to-many relationship by adding a foreign key to the many side to represent the one thing it belongs to
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
# code here
genie = Genie.create(name: "Genie")
lamp = Lamp.create(wishes_remaining: 3, genie: genie)
lamp.update(wishes_remaining: 1)
jafar = Genie.create(name: "Jafar")
Lamp.create(wishes_remaining: 3, genie: jafar)
lamp.update(genie: nil)
```

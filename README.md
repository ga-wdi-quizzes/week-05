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
  puts "Would you take this rose, @#{person}, in exchange for giving an old beggar woman shelter from the bitter cold?"
end


offer_rose(young prince)
would return
  puts "Would you take this rose, young prince, in exchange for giving an old beggar woman shelter from the bitter cold?"
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

town[:residents].delete("Belle")
town[:castle][:guests]<<["Belle"]


# -COMMENTS
#s there a single line command to move one item to another? Merge perhaps?
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

friends.each{|friend| puts "Belle is friends with "+friend}

```

## TDD and RSpec

### Question 4

Describe the differences between unit and functional testing. What type of testing is RSpec and why?

Your answer:
```text

Unit test are tests performed at the smallest level. Unit test are used with Rspec; to check if the output is desired. Functional testing is more broad, it looks if a 'function' (method) of your app works properly. This may require manual testing. Unit tests are more important and aid in development using TDD
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

Describe tests a scenario or detail.
in the describe example, the test creates a scenario where there are 2 tenants and 3 beds

Context tests for variable(s) that change.
if there is room in the apartment, add tenant and expect count to be 3

From a functionality standpoint, they are identical but for readability, we use one over the other.
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
Entity relationship diagram helps us map and organize relationships to one another. we get more broad or more specific. It also details out the type of relationship between an entity or another (1 to 1, 1 to many, many to many)


* Genie
* Lamp
- Owner,<1to1>, <1to1> lamp, Genie, <1toM> Wishes,

* Person
* Pet
- person, <1toM> Pet
```

### Question 7

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema describes the columns a table has. We can represent the one-to-many relationship in rails by modifying the models rb; for example, people.rb will have has_many :wishes, while wish.rb will have belongs_to :people
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

3wishes = Lamp(wish1:'', wish2:'', wish3:'', genie: Genie)
3wishes.save

#in the models
class Genie
  has_many :wishes
  belongs_to :lamp
end

3wishes.update(wish1: 'used', wish2: 'used', wish3: '', genie: Genie)

jafar = Genie.new("Jafar")


3wishes.destroy




```

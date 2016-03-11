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
  puts "Would you take this rose and help out
  an old beggar, #{person}?"
end

offerRose("young prince")

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

  town[:castle][:guests].push("Belle")

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

Unit testing is when you write code to verify each function/method of your code does what it is intended to do.

Functional testing is more holistic to ensure the overall experience is achieving the intended desires and that users can do it in an easy and intuitive way.

RSpec is unit testing because you create specific cases to test specific code behavior of your methods.

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

The Context scenarios are adding more detailed tests to the broader Describe test.  Since there is a restriction of 3 bedrooms, it makes sense to highlight adding a "third tenant".

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
Entity relationship diagrams show the relationships of tables, column, and rows in a database.  It's the same idea as pseudo coding, is basically a rough draft, and helps you better organize your thoughts and get it down on paper before starting to implement.  

A person might own a lamp which contains a genie which grants the person a wish of having a pet.

```

### Question 7

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
Schema is the structure of a table and how the data is organized in rows and columns.  Schema is basically the blueprint of a table or db.

We define associations of classes within the model (belong_to, has_many).  Wishes could "belong_to" people and people could "have_many" wishes.

"People" table could have columns "name" and "ID" while the wishes tables has "wish" "ID" and "people_id".  people.id would equal wishes.people_id in order to select all wishes that belong to a single person.

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

three_wish_lamp = Lamps.new(3)
Genie = Genie.new("Genie")

class Lamps
  has_many :genie
end

class Genie
  belongs_to :lamps

three_wish_lamp.wishes_remaining = 1

Jafar = Genie.new("Jafar")

three_wish_lamp = nil

```

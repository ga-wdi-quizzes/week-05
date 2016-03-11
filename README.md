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
  puts "Would you take this rose and help out an old beggar, #{person}?"
end
offerRose "young prince"
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
town[:residents] - ["Belle"]
town[:castle][:guests] << "Belle" # not sure if you wanted me to save belle to a variable and then remove and re-add her, but this works!
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
  puts "Belle is friends with #{friend}."
end
```

## TDD and RSpec

### Question 4

Describe the differences between unit and functional testing. What type of testing is RSpec and why?

Your answer:
```text
Unit Tests- testing on the 'smallest level', such as an individual method in a class, with all the dependencies mocked up.
Functional Tests- broader tests of the functionality of a larger system; testing many methods at once.
RSpec is a type of unit testing because--as the definition of unit testing suggests--it allows us to test even the smallest aspect of our code, such as ensuring that an argument in a method is not nil or is a capitalized string.
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
`Describe` is used to test the general functionality of a method/describe how the method operates. In the example above, the test is showing that `add_tenant` is supposed to add the name of the tenant to the apartment that is passed in as an argument.

`Context` is used when testing a specific condition of a method. In the example above, `context` is used to test that a tenant can successfully be added under the condition that the number of beds is greater than or equal to the amount of people.
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
ERD stands for 'Entity Relationship Diagram' and it is a tool that we use to visual and describe the data as it relates to the major entities that exist in our programs. Visually, an ERD consists of multiple entities that contain attributes and are connected to one another depending on relationship and dependency. These ERD's do NOT contain methods, as we keep the data separate from the behavior.

Example:
Person :name, :age, :gender
The entity Person is connected to the entities: Lamp and Pet.
  Lamp :color, :weight, :style
  Pet :name, :age, :gender, :species
The entity Lamp is connected to the entity Genie.
Genie :name, :age, :gender, :color, :special_powers

```

### Question 7

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema is a SQL file that creates the tables in our databases.

Using the examples of people to wishes, one-to-many describes a typical relationship found between two entities. For example, one person has many wishes. In writing the schema.sql file, one of the attributes for the wishes would be person_id INT to connect the wishes to the appropriate person. Furthermore, in the person.rb file, one would write has_many :wishes and in the wish.rb file one would write belongs_to :person.
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
genie = Genie.create(name: "Genie")
genie.lamps.create(wishes_remaining: 3)
lamp_good = Genie.find_by(name: "Genie").lamps
lamp_good.update(wishes_remaining: 1)
jafar = Genie.create(name: "Jafar")
jafar.lamps.create(wishes_remaining: 3)
lamp_good.update(wishes_remaining: nil)
```

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

town[:resident] - ["Belle"]
town[:castle][:guests] << "Belle"

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
```Unit Tests test smaller components of code, such as a single method.

Functional Tests test the functionality of a larger component of code, such as many methods at once.

RSPEC is best for testing unit tests, for it allows a dev to individually test the very small components (i.e. spelling errors or mil arguments).
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
```According to the example above, "describe" is intended to test what exactly the method will do (in this case, add a tenant to the apartment that is an argument). Context tests a specific condition of a method, such as a tenant may be added to the apartment ONLY IF the number of beds available is greater than or equal to the number of tenants.
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
An ERD is an "Entity Relationship Diagram." It is basically a visual way to describe data and its relationship to each other. Key to ERDs is dependency, and visually showing what attributes are related to one another according to dependency.

With regards to the example above:
Person :name, :gender, :nationality
The person may own a lamp and pet, and so they are all related
  Lamp :material, :color
  Pet :name, :gender, :species, :age
The entity is the home of the Genie, and so the Person, Lamp, and Genie are definitely connected.
A Pet may be dependent on its Person owner
The Genie may be depending on its Person master
  Genie :name, :gender, :species, :age, :power, :wishes
```

### Question 7

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema is a SQL file that creates tables in databases.

According to the example above, the "one-to-many" describes the relationship between two entities of data (i.e. one person has many wishes).

SCHEMA.SQL
Wishes
person_id INT

PERSON.RB
has_many :wishes

WISHES.RB
belongs_to :person
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

genie = Genie.create(name: "Genie")
genie.lamps.create(wishes_remaining: 3)
lamp_good = Genie.find_by(name: "Genie").lamps
lamp_good.update(wishes_remaining: 1)
jafar = Genie.create(name: "Jafar")
jafar.lamps.create(wishes_remaining: 3)
lamp_good.update(wishes_remaining: nil)
```

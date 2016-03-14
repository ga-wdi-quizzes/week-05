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
def offerRose(person)
  puts "Would you take this rose and help out
  an old beggar, #{person}?"
end
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
var a = town[:residents][1]
town[:castle][:guest].push(a)
# look this up
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
  "Belle is friends with #{friend}"
end
# I added a bonus : I made each of them to be friends
friends.each do |friend|
  friends.reverse.each do |friendr|
    puts "#{friend}is friends with#{friendr}"
  end
  # end
  ```

  ## TDD and RSpec

  ### Question 4

  Describe the differences between unit and functional testing. What type of testing is RSpec and why?

  Your answer:
  ```text
  Unit testing is mainly by developers to test each method in an application code to make sure they satisfy the business requirement.

  Functional testing is mainly used by QA to ensure that a software conforms with business requirement.

  Unit testing usually done in REPL or terminal while Functional testing is usually done on the GUI.
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
  Context is another name for Describe method.

  The difference between Describe and Context method is mainly contextual: context method is used within describe method  for easy readability.
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
  Person (name: "Aladin")
  <!-- where does wishes go here? -->
  has a pet
  has a lamp
  has_many wishes

  Pet (name: "Abu?"")
  belongs_to person

  Lamp (wishes_remaining: x)
  lamp belongs_to person
  lamp has a genie

  Genie (name: "Genie")
  genie belongs_to lamp
  genie takes 3 wishes


  ```

  ### Question 7

  Describe what a schema is, and how we represent a one-to-many relationship in a
  SQL database. If you need an example, you can use: people and wishes
  (one-to-many).

  Your answer:
  ```
  Schema is an outline of entities or values of model(s) in a database.

  class Person
  has_many :wishes
  end

  class wish
  belongs_to :person
  end

  ```

  ### Question 8

  **Assume:**
  1. Your database two working tables, `genies` and `lamps`.
  2. You have a working connection to the database for ActiveRecord.
  3. You have active record models defined for `Genie` and `Lamp`, and the
  relationships between the two are set up in Active Record.
  <!-- Do we want to specifiy what kind of relationship they have, in case some students aren't familiar with the mythology...? --> I had to watch the cartoon summary to solve the related questions.

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
  # 1
  new_lamp = Lamp.create!(wishes_remaining: 3)
  new_genie = lamp.genie.create!(name: "Genie")
  # 2
  class Lamp < ActiveRecord::Base
    has_one :genie
  end

  class Genie < ActiveRecord::Base
    belongs_to :lamp
  end
  # 3
  new_lamp.update(wishes_remaining: 1)
  # 4
  jafar = Lamp.genie.create(name: "Jafar")
  another_lamp = Lamp.create(wishes_remaining: 3)
  another_lamp.update(genie: jafar)
  # 5
  another_lamp.update(lamp: nil)



  ```

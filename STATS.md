# Git Log

```
commit 9a68378310687671345415d5d948ff050868bff6
Author: Sebastian Sangervasi <ssangervasi@squareup.com>
Date:   Mon Aug 5 10:16:30 2019 -0700

    Copied in tests
```

# CLOC


cloc|github.com/AlDanial/cloc v 1.82  T=0.04 s (930.1 files/s, 44620.0 lines/s)
--- | ---

Language|files|blank|comment|code
:-------|-------:|-------:|-------:|-------:
Ruby|28|258|180|1099
Markdown|7|68|0|125
Bourne Again Shell|1|6|0|35
JSON|1|0|0|21
YAML|1|6|10|15
--------|--------|--------|--------|--------
SUM:|38|338|190|1295

# Spec Results
## Fam

```

Fam
  .add_person
    add new person
      adds Mr. Burns to family (FAILED - 1)
    adds same person
      does not add existing person (FAILED - 2)
  .add_parents
    add parents for child who does not exist
      fails to find child (FAILED - 3)
    add non-existent parent for child
      fails to find parent (FAILED - 4)
    adds parent to child with 2 parents
      fails to add 3rd parent (FAILED - 5)
    adds parent to child with 1 parents
      adds 2nd parent (FAILED - 6)
    adds parents to child with no parents
      adds both parents (FAILED - 7)
    add child as parent of self
      adds self as parent (FAILED - 8)
  .get_person
    get existing person
      gets Mr. Burns to family (FAILED - 9)
    get non-existent person
      does not get existing person (FAILED - 10)
  .get_parents
    get parents of 2 parent child
      gets both parents (FAILED - 11)
    get parents of single parent child
      gets 1 parent (FAILED - 12)
    get parents of no parent child
      gets no parents
    get parents of non-existent person
      does not get existing child (FAILED - 13)
  .get_grandparents
    get grandparents of 2 parent child
      gets both parents (FAILED - 14)
    get grandparents of single parent child
      gets 1 parent (FAILED - 15)
    get grandparents of no parent child
      gets no parents
    get grandparents of non-existent child
      does not get existing person (FAILED - 16)
    get grandparents using greatness of -1
      gets 1 parent (FAILED - 17)
    get grandparents using greatness of 1
      gets 3rd generation parent (FAILED - 18)

Fam::Family
  .add_parents
    no inputs
      errors with NoSuchPerson (FAILED - 19)
    add child with too many parents
      errors with TooManyParents (FAILED - 20)
    add child with 2 parents
      adds child with 2 parents (FAILED - 21)
    add child with 1 parents
      adds child with 1 parent (FAILED - 22)
    add child with no parents
      does not add parent (FAILED - 23)
    add child with 1 parent and then add 2nd parent
      adds child with 2 parents (FAILED - 24)
  .get_parents
    no inputs
      errors with NoSuchPerson (FAILED - 25)
    get parents of child with 2 parents
      gets 2 parents (FAILED - 26)
    get parents of child with 1 parents
      gets 1 parent (FAILED - 27)
    get parents of child with no parents
      gets no parent (FAILED - 28)
    get 2st generation parents of child with 2 parents
      gets 2nd generation of parents (FAILED - 29)
  .add_person
    no inputs
      adds nil (FAILED - 30)
    add existing person
      errors with DuplicatePerson (FAILED - 31)
    add new person
      adds Luanne (FAILED - 32)
  .get_person
    no inputs
      errors with NoSuchPerson (FAILED - 33)
    get existing person
      returns Bobby (FAILED - 34)
    get person no in family
      errors with NoSuchPerson (FAILED - 35)
  .to_hash
    displays family as hash (FAILED - 36)

Failures:

  1) Fam.add_person add new person adds Mr. Burns to family
     Failure/Error: expect(subject.output).to eq "Added person: #{person_name}"

       expected: "Added person: Mr. Burns"
            got: ""

       (compared using ==)
     # ./spec/fam/fam_spec.rb:20:in `block (4 levels) in <top (required)>'

  2) Fam.add_person adds same person does not add existing person
     Failure/Error: expect(subject.error).to eq "Person '#{person_name} already in family"

       expected: "Person 'Bart Simpson already in family"
            got: ""

       (compared using ==)
     # ./spec/fam/fam_spec.rb:29:in `block (4 levels) in <top (required)>'

  3) Fam.add_parents add parents for child who does not exist fails to find child
     Failure/Error: expect(subject.error).to eq "No such person '#{child_name}' in family"

       expected: "No such person 'Mr. Burns' in family"
            got: ""

       (compared using ==)
     # ./spec/fam/fam_spec.rb:42:in `block (4 levels) in <top (required)>'

  4) Fam.add_parents add non-existent parent for child fails to find parent
     Failure/Error: expect(subject.error).to eq "No such person '#{parent_names.first}' in family"

       expected: "No such person 'Not a real person' in family"
            got: ""

       (compared using ==)
     # ./spec/fam/fam_spec.rb:51:in `block (4 levels) in <top (required)>'

  5) Fam.add_parents adds parent to child with 2 parents fails to add 3rd parent
     Failure/Error: expect(subject.error).to eq "Child '#{child_name}' can't have more than 2 parents!"

       expected: "Child 'Rod Flanders' can't have more than 2 parents!"
            got: ""

       (compared using ==)
     # ./spec/fam/fam_spec.rb:60:in `block (4 levels) in <top (required)>'

  6) Fam.add_parents adds parent to child with 1 parents adds 2nd parent
     Failure/Error: expect(subject.output).to eq "Added Mona Simpson as parents of #{child_name}"

       expected: "Added Mona Simpson as parents of Homer Simpson"
            got: ""

       (compared using ==)
     # ./spec/fam/fam_spec.rb:69:in `block (4 levels) in <top (required)>'

  7) Fam.add_parents adds parents to child with no parents adds both parents
     Failure/Error: expect(subject.output).to eq "Added Homer Simpson & Marge Simpson as parents of #{child_name}"

       expected: "Added Homer Simpson & Marge Simpson as parents of Bart Simpson"
            got: ""

       (compared using ==)
     # ./spec/fam/fam_spec.rb:79:in `block (4 levels) in <top (required)>'

  8) Fam.add_parents add child as parent of self adds self as parent
     Failure/Error: expect(subject.output).to eq "Added #{child_name} & #{child_name} as parents of #{child_name}"

       expected: "Added Bart Simpson & Bart Simpson as parents of Bart Simpson"
            got: ""

       (compared using ==)
     # ./spec/fam/fam_spec.rb:89:in `block (4 levels) in <top (required)>'

  9) Fam.get_person get existing person gets Mr. Burns to family
     Failure/Error: expect(subject.output).to eq person_name

       expected: "Bart Simpson"
            got: ""

       (compared using ==)
     # ./spec/fam/fam_spec.rb:102:in `block (4 levels) in <top (required)>'

  10) Fam.get_person get non-existent person does not get existing person
      Failure/Error: expect(subject.error).to eq "No such person '#{person_name}' in family"

        expected: "No such person 'Mr. Burns' in family"
             got: ""

        (compared using ==)
      # ./spec/fam/fam_spec.rb:110:in `block (4 levels) in <top (required)>'

  11) Fam.get_parents get parents of 2 parent child gets both parents
      Failure/Error: expect(subject.output).to eq "Ned Flanders\nMaude Flanders"

        expected: "Ned Flanders\nMaude Flanders"
             got: ""

        (compared using ==)

        Diff:
        @@ -1,3 +1 @@
        -Ned Flanders
        -Maude Flanders
      # ./spec/fam/fam_spec.rb:122:in `block (4 levels) in <top (required)>'

  12) Fam.get_parents get parents of single parent child gets 1 parent
      Failure/Error: expect(subject.output).to eq "Grampa Simpson"

        expected: "Grampa Simpson"
             got: ""

        (compared using ==)
      # ./spec/fam/fam_spec.rb:130:in `block (4 levels) in <top (required)>'

  13) Fam.get_parents get parents of non-existent person does not get existing child
      Failure/Error: expect(subject.error).to eq "No such person '#{child_name}' in family"

        expected: "No such person 'Mr. Burns' in family"
             got: ""

        (compared using ==)
      # ./spec/fam/fam_spec.rb:146:in `block (4 levels) in <top (required)>'

  14) Fam.get_grandparents get grandparents of 2 parent child gets both parents
      Failure/Error: expect(subject.output).to eq "Grampa Simpson\nClancy Bouvier\nJacqueline Bouvier"

        expected: "Grampa Simpson\nClancy Bouvier\nJacqueline Bouvier"
             got: ""

        (compared using ==)

        Diff:
        @@ -1,4 +1 @@
        -Grampa Simpson
        -Clancy Bouvier
        -Jacqueline Bouvier
      # ./spec/fam/fam_spec.rb:159:in `block (4 levels) in <top (required)>'

  15) Fam.get_grandparents get grandparents of single parent child gets 1 parent
      Failure/Error: expect(subject.output).to eq "Grampa Simpson"

        expected: "Grampa Simpson"
             got: ""

        (compared using ==)
      # ./spec/fam/fam_spec.rb:168:in `block (4 levels) in <top (required)>'

  16) Fam.get_grandparents get grandparents of non-existent child does not get existing person
      Failure/Error: expect(subject.error).to eq "No such person '#{child_name}' in family"

        expected: "No such person 'Mr. Burns' in family"
             got: ""

        (compared using ==)
      # ./spec/fam/fam_spec.rb:186:in `block (4 levels) in <top (required)>'

  17) Fam.get_grandparents get grandparents using greatness of -1 gets 1 parent
      Failure/Error: expect(subject.output).to eq Hatchery::Names.homer

        expected: "Homer Simpson"
             got: ""

        (compared using ==)
      # ./spec/fam/fam_spec.rb:196:in `block (4 levels) in <top (required)>'

  18) Fam.get_grandparents get grandparents using greatness of 1 gets 3rd generation parent
      Failure/Error: expect(subject.output).to eq "Orville Simpson\nYuma Hickman\nMeaux Bouvier\nGenevieve Bouvier\nAlvarine Bisque\nFerdinand Gurney"

        expected: "Orville Simpson\nYuma Hickman\nMeaux Bouvier\nGenevieve Bouvier\nAlvarine Bisque\nFerdinand Gurney"
             got: ""

        (compared using ==)

        Diff:
        @@ -1,7 +1 @@
        -Orville Simpson
        -Yuma Hickman
        -Meaux Bouvier
        -Genevieve Bouvier
        -Alvarine Bisque
        -Ferdinand Gurney
      # ./spec/fam/fam_spec.rb:205:in `block (4 levels) in <top (required)>'

  19) Fam::Family.add_parents no inputs errors with NoSuchPerson
      Failure/Error: family.add_person(person_name: 'Bobby')

      NoMethodError:
        undefined method `add_person' for #<Fam::Family:0x00007f801b9d40c0>
      # ./spec/fam/family_spec.rb:9:in `block (2 levels) in <top (required)>'

  20) Fam::Family.add_parents add child with too many parents errors with TooManyParents
      Failure/Error: family.add_person(person_name: 'Bobby')

      NoMethodError:
        undefined method `add_person' for #<Fam::Family:0x00007f801c341978>
      # ./spec/fam/family_spec.rb:9:in `block (2 levels) in <top (required)>'

  21) Fam::Family.add_parents add child with 2 parents adds child with 2 parents
      Failure/Error: family.add_person(person_name: 'Bobby')

      NoMethodError:
        undefined method `add_person' for #<Fam::Family:0x00007f801c34ad70>
      # ./spec/fam/family_spec.rb:9:in `block (2 levels) in <top (required)>'

  22) Fam::Family.add_parents add child with 1 parents adds child with 1 parent
      Failure/Error: family.add_person(person_name: 'Bobby')

      NoMethodError:
        undefined method `add_person' for #<Fam::Family:0x00007f801c352b38>
      # ./spec/fam/family_spec.rb:9:in `block (2 levels) in <top (required)>'

  23) Fam::Family.add_parents add child with no parents does not add parent
      Failure/Error: family.add_person(person_name: 'Bobby')

      NoMethodError:
        undefined method `add_person' for #<Fam::Family:0x00007f801c35b238>
      # ./spec/fam/family_spec.rb:9:in `block (2 levels) in <top (required)>'

  24) Fam::Family.add_parents add child with 1 parent and then add 2nd parent adds child with 2 parents
      Failure/Error: family.add_person(person_name: 'Bobby')

      NoMethodError:
        undefined method `add_person' for #<Fam::Family:0x00007f801c363f50>
      # ./spec/fam/family_spec.rb:9:in `block (2 levels) in <top (required)>'

  25) Fam::Family.get_parents no inputs errors with NoSuchPerson
      Failure/Error: family.add_person(person_name: 'Bobby')

      NoMethodError:
        undefined method `add_person' for #<Fam::Family:0x00007f801c36b110>
      # ./spec/fam/family_spec.rb:9:in `block (2 levels) in <top (required)>'

  26) Fam::Family.get_parents get parents of child with 2 parents gets 2 parents
      Failure/Error: family.add_person(person_name: 'Bobby')

      NoMethodError:
        undefined method `add_person' for #<Fam::Family:0x00007f801c373928>
      # ./spec/fam/family_spec.rb:9:in `block (2 levels) in <top (required)>'

  27) Fam::Family.get_parents get parents of child with 1 parents gets 1 parent
      Failure/Error: family.add_person(person_name: 'Bobby')

      NoMethodError:
        undefined method `add_person' for #<Fam::Family:0x00007f801c37b240>
      # ./spec/fam/family_spec.rb:9:in `block (2 levels) in <top (required)>'

  28) Fam::Family.get_parents get parents of child with no parents gets no parent
      Failure/Error: family.add_person(person_name: 'Bobby')

      NoMethodError:
        undefined method `add_person' for #<Fam::Family:0x00007f801c383b98>
      # ./spec/fam/family_spec.rb:9:in `block (2 levels) in <top (required)>'

  29) Fam::Family.get_parents get 2st generation parents of child with 2 parents gets 2nd generation of parents
      Failure/Error: family.add_person(person_name: 'Bobby')

      NoMethodError:
        undefined method `add_person' for #<Fam::Family:0x00007f801c380b50>
      # ./spec/fam/family_spec.rb:9:in `block (2 levels) in <top (required)>'

  30) Fam::Family.add_person no inputs adds nil
      Failure/Error: family.add_person(person_name: 'Bobby')

      NoMethodError:
        undefined method `add_person' for #<Fam::Family:0x00007f801c388580>
      # ./spec/fam/family_spec.rb:9:in `block (2 levels) in <top (required)>'

  31) Fam::Family.add_person add existing person errors with DuplicatePerson
      Failure/Error: family.add_person(person_name: 'Bobby')

      NoMethodError:
        undefined method `add_person' for #<Fam::Family:0x00007f801c390be0>
      # ./spec/fam/family_spec.rb:9:in `block (2 levels) in <top (required)>'

  32) Fam::Family.add_person add new person adds Luanne
      Failure/Error: family.add_person(person_name: 'Bobby')

      NoMethodError:
        undefined method `add_person' for #<Fam::Family:0x00007f801c398a98>
      # ./spec/fam/family_spec.rb:9:in `block (2 levels) in <top (required)>'

  33) Fam::Family.get_person no inputs errors with NoSuchPerson
      Failure/Error: family.add_person(person_name: 'Bobby')

      NoMethodError:
        undefined method `add_person' for #<Fam::Family:0x00007f801c3a0130>
      # ./spec/fam/family_spec.rb:9:in `block (2 levels) in <top (required)>'

  34) Fam::Family.get_person get existing person returns Bobby
      Failure/Error: family.add_person(person_name: 'Bobby')

      NoMethodError:
        undefined method `add_person' for #<Fam::Family:0x00007f801c3b0698>
      # ./spec/fam/family_spec.rb:9:in `block (2 levels) in <top (required)>'

  35) Fam::Family.get_person get person no in family errors with NoSuchPerson
      Failure/Error: family.add_person(person_name: 'Bobby')

      NoMethodError:
        undefined method `add_person' for #<Fam::Family:0x00007f801c3b8d98>
      # ./spec/fam/family_spec.rb:9:in `block (2 levels) in <top (required)>'

  36) Fam::Family.to_hash displays family as hash
      Failure/Error: family.add_person(person_name: 'Bobby')

      NoMethodError:
        undefined method `add_person' for #<Fam::Family:0x00007f801c3c1d30>
      # ./spec/fam/family_spec.rb:9:in `block (2 levels) in <top (required)>'

Finished in 0.03494 seconds (files took 0.37512 seconds to load)
38 examples, 36 failures

Failed examples:

rspec ./spec/fam/fam_spec.rb:19 # Fam.add_person add new person adds Mr. Burns to family
rspec ./spec/fam/fam_spec.rb:28 # Fam.add_person adds same person does not add existing person
rspec ./spec/fam/fam_spec.rb:41 # Fam.add_parents add parents for child who does not exist fails to find child
rspec ./spec/fam/fam_spec.rb:50 # Fam.add_parents add non-existent parent for child fails to find parent
rspec ./spec/fam/fam_spec.rb:59 # Fam.add_parents adds parent to child with 2 parents fails to add 3rd parent
rspec ./spec/fam/fam_spec.rb:68 # Fam.add_parents adds parent to child with 1 parents adds 2nd parent
rspec ./spec/fam/fam_spec.rb:78 # Fam.add_parents adds parents to child with no parents adds both parents
rspec ./spec/fam/fam_spec.rb:88 # Fam.add_parents add child as parent of self adds self as parent
rspec ./spec/fam/fam_spec.rb:101 # Fam.get_person get existing person gets Mr. Burns to family
rspec ./spec/fam/fam_spec.rb:109 # Fam.get_person get non-existent person does not get existing person
rspec ./spec/fam/fam_spec.rb:121 # Fam.get_parents get parents of 2 parent child gets both parents
rspec ./spec/fam/fam_spec.rb:129 # Fam.get_parents get parents of single parent child gets 1 parent
rspec ./spec/fam/fam_spec.rb:145 # Fam.get_parents get parents of non-existent person does not get existing child
rspec ./spec/fam/fam_spec.rb:158 # Fam.get_grandparents get grandparents of 2 parent child gets both parents
rspec ./spec/fam/fam_spec.rb:167 # Fam.get_grandparents get grandparents of single parent child gets 1 parent
rspec ./spec/fam/fam_spec.rb:185 # Fam.get_grandparents get grandparents of non-existent child does not get existing person
rspec ./spec/fam/fam_spec.rb:195 # Fam.get_grandparents get grandparents using greatness of -1 gets 1 parent
rspec ./spec/fam/fam_spec.rb:204 # Fam.get_grandparents get grandparents using greatness of 1 gets 3rd generation parent
rspec ./spec/fam/family_spec.rb:21 # Fam::Family.add_parents no inputs errors with NoSuchPerson
rspec ./spec/fam/family_spec.rb:30 # Fam::Family.add_parents add child with too many parents errors with TooManyParents
rspec ./spec/fam/family_spec.rb:39 # Fam::Family.add_parents add child with 2 parents adds child with 2 parents
rspec ./spec/fam/family_spec.rb:56 # Fam::Family.add_parents add child with 1 parents adds child with 1 parent
rspec ./spec/fam/family_spec.rb:73 # Fam::Family.add_parents add child with no parents does not add parent
rspec ./spec/fam/family_spec.rb:96 # Fam::Family.add_parents add child with 1 parent and then add 2nd parent adds child with 2 parents
rspec ./spec/fam/family_spec.rb:117 # Fam::Family.get_parents no inputs errors with NoSuchPerson
rspec ./spec/fam/family_spec.rb:130 # Fam::Family.get_parents get parents of child with 2 parents gets 2 parents
rspec ./spec/fam/family_spec.rb:143 # Fam::Family.get_parents get parents of child with 1 parents gets 1 parent
rspec ./spec/fam/family_spec.rb:156 # Fam::Family.get_parents get parents of child with no parents gets no parent
rspec ./spec/fam/family_spec.rb:175 # Fam::Family.get_parents get 2st generation parents of child with 2 parents gets 2nd generation of parents
rspec ./spec/fam/family_spec.rb:187 # Fam::Family.add_person no inputs adds nil
rspec ./spec/fam/family_spec.rb:204 # Fam::Family.add_person add existing person errors with DuplicatePerson
rspec ./spec/fam/family_spec.rb:212 # Fam::Family.add_person add new person adds Luanne
rspec ./spec/fam/family_spec.rb:233 # Fam::Family.get_person no inputs errors with NoSuchPerson
rspec ./spec/fam/family_spec.rb:241 # Fam::Family.get_person get existing person returns Bobby
rspec ./spec/fam/family_spec.rb:249 # Fam::Family.get_person get person no in family errors with NoSuchPerson
rspec ./spec/fam/family_spec.rb:258 # Fam::Family.to_hash displays family as hash

```

## Boilerplate

```

Fam::CLI::Add::Parents
  when the child and parent names are given
    behaves like a successful command
      exits with a zero status code (FAILED - 1)
      matches the expected output (FAILED - 2)
  when all names are missing
    behaves like a failed command
      exits with a non-zero status code (FAILED - 3)
      matches the expected error (FAILED - 4)

Fam::CLI::Add::Person
  when a name is given
    behaves like a successful command
      exits with a zero status code (FAILED - 5)
      matches the expected output (FAILED - 6)
  when no name is provided
    behaves like a failed command
      exits with a non-zero status code
      matches the expected error

Fam::CLI::Get::Parents
  when a child name is given
    behaves like a successful command
      exits with a zero status code (FAILED - 7)
      matches the expected output (FAILED - 8)
  when the child name is missing
    behaves like a failed command
      exits with a non-zero status code (FAILED - 9)
      matches the expected error (FAILED - 10)

Fam::CLI::Get::Person
  when a name is given
    behaves like a successful command
      exits with a zero status code (FAILED - 11)
      matches the expected output (FAILED - 12)
  when the name is missing
    behaves like a failed command
      exits with a non-zero status code (FAILED - 13)
      matches the expected error (FAILED - 14)

Fam::File::Reader::JSONReader
  #read
    when the file does not exist
      raises an error
    when the file exists
      should be a kind of Hash

Fam::File::Writer::JSONWriter
  #write
    should be a kind of String
    modifies the specified file

Failures:

  1) Fam::CLI::Add::Parents when the child and parent names are given behaves like a successful command exits with a zero status code
     Failure/Error:
       expect(
         Hatchery::Names.simpsons.map do |person_name|
           exec_fam('add', 'person', person_name)
         end
       ).to(
         all(be_success),
         'Must be able to `add person` before testing `get parents`'
       )

       Must be able to `add person` before testing `get parents`
     Shared Example Group: "a successful command" called from ./spec/boilerplate/cli/add/parents_spec.rb:25
     # ./spec/boilerplate/cli/add/parents_spec.rb:14:in `block (2 levels) in <top (required)>'

  2) Fam::CLI::Add::Parents when the child and parent names are given behaves like a successful command matches the expected output
     Failure/Error:
       expect(
         Hatchery::Names.simpsons.map do |person_name|
           exec_fam('add', 'person', person_name)
         end
       ).to(
         all(be_success),
         'Must be able to `add person` before testing `get parents`'
       )

       Must be able to `add person` before testing `get parents`
     Shared Example Group: "a successful command" called from ./spec/boilerplate/cli/add/parents_spec.rb:25
     # ./spec/boilerplate/cli/add/parents_spec.rb:14:in `block (2 levels) in <top (required)>'

  3) Fam::CLI::Add::Parents when all names are missing behaves like a failed command exits with a non-zero status code
     Failure/Error:
       expect(
         Hatchery::Names.simpsons.map do |person_name|
           exec_fam('add', 'person', person_name)
         end
       ).to(
         all(be_success),
         'Must be able to `add person` before testing `get parents`'
       )

       Must be able to `add person` before testing `get parents`
     Shared Example Group: "a failed command" called from ./spec/boilerplate/cli/add/parents_spec.rb:35
     # ./spec/boilerplate/cli/add/parents_spec.rb:14:in `block (2 levels) in <top (required)>'

  4) Fam::CLI::Add::Parents when all names are missing behaves like a failed command matches the expected error
     Failure/Error:
       expect(
         Hatchery::Names.simpsons.map do |person_name|
           exec_fam('add', 'person', person_name)
         end
       ).to(
         all(be_success),
         'Must be able to `add person` before testing `get parents`'
       )

       Must be able to `add person` before testing `get parents`
     Shared Example Group: "a failed command" called from ./spec/boilerplate/cli/add/parents_spec.rb:35
     # ./spec/boilerplate/cli/add/parents_spec.rb:14:in `block (2 levels) in <top (required)>'

  5) Fam::CLI::Add::Person when a name is given behaves like a successful command exits with a zero status code
     Failure/Error: expect(subject.status).to eq(0), (subject.output + subject.error)
     Shared Example Group: "a successful command" called from ./spec/boilerplate/cli/add/person_spec.rb:13
     # ./spec/spec_helpers/cli.rb:28:in `block (3 levels) in <top (required)>'

  6) Fam::CLI::Add::Person when a name is given behaves like a successful command matches the expected output
     Failure/Error: expect(subject.output).to match expected_output
       expected "" to match "José Exemplo"
     Shared Example Group: "a successful command" called from ./spec/boilerplate/cli/add/person_spec.rb:13
     # ./spec/spec_helpers/cli.rb:32:in `block (3 levels) in <top (required)>'

  7) Fam::CLI::Get::Parents when a child name is given behaves like a successful command exits with a zero status code
     Failure/Error:
       expect(
         Hatchery::Names.simpsons.map do |person_name|
           exec_fam('add', 'person', person_name)
         end
       ).to(
         all(be_success),
         'Must be able to `add person` before testing `get parents`'
       )

       Must be able to `add person` before testing `get parents`
     Shared Example Group: "a successful command" called from ./spec/boilerplate/cli/get/parents_spec.rb:33
     # ./spec/boilerplate/cli/get/parents_spec.rb:14:in `block (2 levels) in <top (required)>'

  8) Fam::CLI::Get::Parents when a child name is given behaves like a successful command matches the expected output
     Failure/Error:
       expect(
         Hatchery::Names.simpsons.map do |person_name|
           exec_fam('add', 'person', person_name)
         end
       ).to(
         all(be_success),
         'Must be able to `add person` before testing `get parents`'
       )

       Must be able to `add person` before testing `get parents`
     Shared Example Group: "a successful command" called from ./spec/boilerplate/cli/get/parents_spec.rb:33
     # ./spec/boilerplate/cli/get/parents_spec.rb:14:in `block (2 levels) in <top (required)>'

  9) Fam::CLI::Get::Parents when the child name is missing behaves like a failed command exits with a non-zero status code
     Failure/Error:
       expect(
         Hatchery::Names.simpsons.map do |person_name|
           exec_fam('add', 'person', person_name)
         end
       ).to(
         all(be_success),
         'Must be able to `add person` before testing `get parents`'
       )

       Must be able to `add person` before testing `get parents`
     Shared Example Group: "a failed command" called from ./spec/boilerplate/cli/get/parents_spec.rb:43
     # ./spec/boilerplate/cli/get/parents_spec.rb:14:in `block (2 levels) in <top (required)>'

  10) Fam::CLI::Get::Parents when the child name is missing behaves like a failed command matches the expected error
      Failure/Error:
        expect(
          Hatchery::Names.simpsons.map do |person_name|
            exec_fam('add', 'person', person_name)
          end
        ).to(
          all(be_success),
          'Must be able to `add person` before testing `get parents`'
        )

        Must be able to `add person` before testing `get parents`
      Shared Example Group: "a failed command" called from ./spec/boilerplate/cli/get/parents_spec.rb:43
      # ./spec/boilerplate/cli/get/parents_spec.rb:14:in `block (2 levels) in <top (required)>'

  11) Fam::CLI::Get::Person when a name is given behaves like a successful command exits with a zero status code
      Failure/Error:
        expect(exec_fam('add', 'person', person_name))
          .to(
            be_success,
            'Must be able to `add person` before testing `get person`'
          )

        Must be able to `add person` before testing `get person`
      Shared Example Group: "a successful command" called from ./spec/boilerplate/cli/get/person_spec.rb:21
      # ./spec/boilerplate/cli/get/person_spec.rb:10:in `block (2 levels) in <top (required)>'

  12) Fam::CLI::Get::Person when a name is given behaves like a successful command matches the expected output
      Failure/Error:
        expect(exec_fam('add', 'person', person_name))
          .to(
            be_success,
            'Must be able to `add person` before testing `get person`'
          )

        Must be able to `add person` before testing `get person`
      Shared Example Group: "a successful command" called from ./spec/boilerplate/cli/get/person_spec.rb:21
      # ./spec/boilerplate/cli/get/person_spec.rb:10:in `block (2 levels) in <top (required)>'

  13) Fam::CLI::Get::Person when the name is missing behaves like a failed command exits with a non-zero status code
      Failure/Error:
        expect(exec_fam('add', 'person', person_name))
          .to(
            be_success,
            'Must be able to `add person` before testing `get person`'
          )

        Must be able to `add person` before testing `get person`
      Shared Example Group: "a failed command" called from ./spec/boilerplate/cli/get/person_spec.rb:31
      # ./spec/boilerplate/cli/get/person_spec.rb:10:in `block (2 levels) in <top (required)>'

  14) Fam::CLI::Get::Person when the name is missing behaves like a failed command matches the expected error
      Failure/Error:
        expect(exec_fam('add', 'person', person_name))
          .to(
            be_success,
            'Must be able to `add person` before testing `get person`'
          )

        Must be able to `add person` before testing `get person`
      Shared Example Group: "a failed command" called from ./spec/boilerplate/cli/get/person_spec.rb:31
      # ./spec/boilerplate/cli/get/person_spec.rb:10:in `block (2 levels) in <top (required)>'

Finished in 9.64 seconds (files took 0.88864 seconds to load)
20 examples, 14 failures

Failed examples:

rspec ./spec/boilerplate/cli/add/parents_spec.rb[1:1:1:1] # Fam::CLI::Add::Parents when the child and parent names are given behaves like a successful command exits with a zero status code
rspec ./spec/boilerplate/cli/add/parents_spec.rb[1:1:1:2] # Fam::CLI::Add::Parents when the child and parent names are given behaves like a successful command matches the expected output
rspec ./spec/boilerplate/cli/add/parents_spec.rb[1:2:1:1] # Fam::CLI::Add::Parents when all names are missing behaves like a failed command exits with a non-zero status code
rspec ./spec/boilerplate/cli/add/parents_spec.rb[1:2:1:2] # Fam::CLI::Add::Parents when all names are missing behaves like a failed command matches the expected error
rspec ./spec/boilerplate/cli/add/person_spec.rb[1:1:1:1] # Fam::CLI::Add::Person when a name is given behaves like a successful command exits with a zero status code
rspec ./spec/boilerplate/cli/add/person_spec.rb[1:1:1:2] # Fam::CLI::Add::Person when a name is given behaves like a successful command matches the expected output
rspec ./spec/boilerplate/cli/get/parents_spec.rb[1:1:1:1] # Fam::CLI::Get::Parents when a child name is given behaves like a successful command exits with a zero status code
rspec ./spec/boilerplate/cli/get/parents_spec.rb[1:1:1:2] # Fam::CLI::Get::Parents when a child name is given behaves like a successful command matches the expected output
rspec ./spec/boilerplate/cli/get/parents_spec.rb[1:2:1:1] # Fam::CLI::Get::Parents when the child name is missing behaves like a failed command exits with a non-zero status code
rspec ./spec/boilerplate/cli/get/parents_spec.rb[1:2:1:2] # Fam::CLI::Get::Parents when the child name is missing behaves like a failed command matches the expected error
rspec ./spec/boilerplate/cli/get/person_spec.rb[1:1:1:1] # Fam::CLI::Get::Person when a name is given behaves like a successful command exits with a zero status code
rspec ./spec/boilerplate/cli/get/person_spec.rb[1:1:1:2] # Fam::CLI::Get::Person when a name is given behaves like a successful command matches the expected output
rspec ./spec/boilerplate/cli/get/person_spec.rb[1:2:1:1] # Fam::CLI::Get::Person when the name is missing behaves like a failed command exits with a non-zero status code
rspec ./spec/boilerplate/cli/get/person_spec.rb[1:2:1:2] # Fam::CLI::Get::Person when the name is missing behaves like a failed command matches the expected error

```


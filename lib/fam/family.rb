# frozen_string_literal: true

module Fam
  class Family
    module Errors
      class DuplicatePerson < StandardError
        MESSAGE = "Person '%s' already in family"

        def initialize(person_name)
          super(MESSAGE % person_name)
        end
      end

      class NoSuchPerson < StandardError
        MESSAGE = "No such person '%s' in family"

        def initialize(person_name)
          super(MESSAGE % person_name)
        end
      end

      class TooManyParents < StandardError
        MESSAGE = "Child '%s' can't have more than 2 parents!"

        def initialize(child_name)
          super(MESSAGE % child_name)
        end
      end
    end

    def initialize(family: {})
      @family = family.transform_keys { |k| k&.to_s }
    end

    def add_person(person_name:)
      raise Errors::DuplicatePerson, person_name if family.key? person_name

      family[person_name] = []

      person_name
    end

    def add_parents(child_name:, parent_names:)
      [
        child_name,
        *parent_names,
      ].each do |name|
        raise Errors::NoSuchPerson, name unless family.key? name
      end

      existing_parents = family.fetch child_name
      raise Errors::TooManyParents, child_name if (existing_parents.length + parent_names.length) > 2

      family[child_name] += parent_names

      family
    end

    def get_person(person_name:)
      raise Errors::NoSuchPerson, person_name unless family.key? person_name

      person_name
    end

    def get_parents(child_name:, generations:)
      child = get_person(person_name: child_name)
      return child if generations.to_i.negative?

      family.fetch(child_name).flat_map do |parent|
        get_parents(child_name: parent, generations: generations - 1)
      end
    end

    def to_h
      family
    end
    alias to_hash to_h

    private

    attr_reader :family
  end
end

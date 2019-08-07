# frozen_string_literal: true

module Fam
  class Family
    module Errors
      class DuplicatePerson < StandardError; end
      class NoSuchPerson < StandardError; end
      class TooManyParents < StandardError; end
    end

    def initialize(family: {})
      @family = family.transform_keys { |k| k&.to_s }
    end

    def add_person(person_name:)
      raise Errors::DuplicatePerson, "Person '#{person_name}' already in family" if family.key? person_name

      family[person_name] = []

      person_name
    end

    def add_parents(child_name:, parent_names:)
      [
        child_name,
        *parent_names,
      ].each do |name|
        raise Errors::NoSuchPerson, "No such person '#{name}' in family" unless family.key? name
      end

      existing_parents = family.fetch child_name
      raise Errors::TooManyParents, "Child '#{child_name}' can't have more than 2 parents!" if (existing_parents.length + parent_names.length) > 2

      family[child_name] += parent_names

      family
    end

    def to_h
      family
    end
    alias to_hash to_h

    private

    attr_reader :family
  end
end

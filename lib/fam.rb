# frozen_string_literal: true

require 'fam/version'
require 'fam/cli/result'
require 'fam/file'
require 'fam/meta'

require 'fam/family'

module Fam
  include Fam::Meta

  GET_PARENTS_AT_GENERATION = lambda do |child_name:, generations: 0, family:|
    family.get_parents(child_name: child_name, generations: generations).join("\n")
  end

  cli(:add_person,
      args: %i[output_path person_name],
      reskew: [Family::Errors::DuplicatePerson],
      dew: lambda do |output_path:, person_name:, family:|
             family.add_person person_name: person_name.to_s
             write path: output_path, json_hash: family.to_h
             "Added person: #{person_name}"
           end)

  cli(:add_parents,
      args: %i[output_path child_name parent_names],
      reskew: [Family::Errors::NoSuchPerson, Family::Errors::TooManyParents],
      dew: lambda do |output_path:, child_name:, parent_names:, family:|
             family.add_parents child_name: child_name, parent_names: parent_names
             write path: output_path, json_hash: family.to_h
             "Added #{parent_names.join(' & ')} as parents of #{child_name}"
           end)

  cli(:get_person,
      args: %i[person_name],
      reskew: [Family::Errors::NoSuchPerson],
      dew: ->(person_name:, family:) { family.get_person person_name: person_name })

  cli(:get_parents,
      args: %i[child_name],
      reskew: [Family::Errors::NoSuchPerson],
      dew: GET_PARENTS_AT_GENERATION)

  cli(:get_grandparents,
      args: %i[child_name greatness],
      reskew: [Family::Errors::NoSuchPerson],
      dew: ->(child_name:, greatness:, family:) { GET_PARENTS_AT_GENERATION.call(child_name: child_name, generations: greatness + 1, family: family) })
end

# frozen_string_literal: true

module Types
  class MicropostType < Types::BaseObject
    field :id, ID, null: false
    field :content, String
    field :user_id, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :picture, String
    field :user, Types::UserType
  end
end

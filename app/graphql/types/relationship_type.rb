# frozen_string_literal: true

module Types
  class RelationshipType < Types::BaseObject
    field :id, ID, null: false
    field :follower_id, Integer
    field :followed_id, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    # field :user, [Types::UserType], null: true

    # def user
    #   temp = follower_id
    #   user1=User.find_by(temp)
    #   object.user1.all
    # end

  end
end

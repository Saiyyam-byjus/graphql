# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :email, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :password_digest, String
    field :remember_digest, String
    field :admin, Boolean
    field :activation_digest, String
    field :activated, Boolean
    field :activated_at, GraphQL::Types::ISO8601DateTime
    field :reset_digest, String
    field :reset_sent_at, GraphQL::Types::ISO8601DateTime
    field :micropost, [Types::MicropostType], null: true
    field :relationship, [Types::RelationshipType], null: true
    field :followersList, [Types::UserType], null: true

    def micropost
      object.microposts.all
    end

    def relationship
      object.followers.all
    end

    def followersList
      @temp = object.followers.all
      
    end
    


  end
end

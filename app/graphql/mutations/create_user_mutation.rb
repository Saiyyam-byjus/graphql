module Mutations
  class CreateUserMutation < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    # argument :name, String, required: true

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end

    field :user, Types::UserType, null: false
      argument :name, String, required: true do
        description "The name field is a string type and is required for the new user"
      end
      argument :email, String, required: true do
        description "The email field is a string type and is required for the new user"
      end
      argument :password, String, required: true do
        description "The password field is a necessary and string type"
      end
      def resolve(name:, email:, password:)
        @user = User.new(name: name, email: email, password: password)
        if(@user.save)
          {
            user: @user,
            errors: []
          } else{
            user: nil,
            errors: @user.errors.full_messages
          }
        end
      end







  end
end

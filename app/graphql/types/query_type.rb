module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end
    #field :posts, [Types::PostType], null: false do
  #   description "Query that selects all posts"
  # end
  # field :postsCount, Integer, null:false do
  #   description "Query that returns the total postcounts"
  # end
  # def posts
  #   return Post.all
  # end
  # def postsCount
  #   return Post.count
  # end

  field :users, [Types::UserType], null: false do
    description "Query for viewing all users"
  end
  
  field :usersCount, Integer, null: false do
    description "Query for counting all users"
  end

  # field :micropost, [Types:MicropostType], null: false do
  #   description "MicroPost for a user"
  # end

  # def micropost
  #   return Micropost.all
  # end

  # field :particularUser, [Types::UserType], null: false do
  #   description "Query for viewing a particular user"
  # end

  def users
    return User.all
  end
# /user/:id
field :user, Types::UserType, null: false do
  argument :id, ID, required: true
end

def user(id:)
  User.find(id)
end

field :userFind, Types::UserType, null: false do
  argument :email, String, required: true
  argument :password, String, required: true
end

def userFind(email: ,password: )
  temp = User.find_by(email: email)
  if(temp.authenticate(password))
    temp
  else
    null
  end
end

  # def particularUser(id)
  #   if id.empty? 
  #     0
  #   else
  #     @user = User.find_by(id)
  #   end
  # end

  def usersCount
    return User.count
  end

  end
end
# def full_title(page_title = '')
#   base_title = "Ruby on Rails Tutorial Sample App"
#   if page_title.empty?
#     base_title
#   else
#     page_title + " | " + base_title
#   end
# end
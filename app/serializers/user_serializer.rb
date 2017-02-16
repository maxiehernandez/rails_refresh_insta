class UserSerializer < ActiveModel::Serializer
  attributes(User.attribute_names.map(&:to_sym))
  has_many :comments, :key=>"comments"
  has_many :posts, :key=>"posts"
end

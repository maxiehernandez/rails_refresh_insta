class PostSerializer < ActiveModel::Serializer
  attributes(User.attribute_names.map(&:to_sym))
  belongs_to :user, :key=>"user"
  belongs_to :comment, :key=>"comment"
end

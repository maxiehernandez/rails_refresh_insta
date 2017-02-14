class PostSerializer < ActiveModel::Serializer
  attributes(Post.attribute_names.map(&:to_sym))
  belongs_to :user, :key=>"user"
  has_many :comments, :key=>"comments"
end

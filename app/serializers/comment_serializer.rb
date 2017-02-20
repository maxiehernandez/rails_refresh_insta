class CommentSerializer < ActiveModel::Serializer
  attributes(Comment.attribute_names.map(&:to_sym))
  belongs_to :post, :key=>"post"
  belongs_to :user, :key=>"user"
end

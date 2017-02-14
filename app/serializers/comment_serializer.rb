class CommentSerializer < ActiveModel::Serializer
  attributes(Comment.attribute_names.map(&:to_sym))
  # attributes :id, :body
  belongs_to :post, :key=>"post"
  belongs_to :user, :key=>"comments"
end

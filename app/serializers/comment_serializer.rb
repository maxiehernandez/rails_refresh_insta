class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body
  belongs_to :post, :key=>"post"
  belongs_to :user, :key=>"comments"
end

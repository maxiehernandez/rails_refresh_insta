class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  mount_uploader :original_filename, ImageUploader

  # elasticsearch indexes
 update_index('store#post') { self } # specifying index, type and back-reference
 # for updating after user save or destroy associations
 alias_attribute :title, :file_name
 alias_attribute :description, :caption

end

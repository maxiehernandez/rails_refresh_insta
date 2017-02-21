class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

   def self.uploading(file)
     uploaded_io = file
     File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
       file.write(uploaded_io.read)
     end
     path = Rails.root.join('public', 'uploads', uploaded_io.original_filename)
     return path
   end


   def self.search(posts, query)
    #  if query == "*"
    #    return posts
    #  end
     posts.select { |post|
       if !post.file_name.nil?
         post.caption.downcase.include?(query) || post.file_name.downcase.include?(query)
       end
     }
   end




  # elasticsearch indexes
 # update_index('store#post') { self } # specifying index, type and back-reference
 # # for updating after user save or destroy associations
 # alias_attribute :title, :file_name
 # alias_attribute :description, :caption

end

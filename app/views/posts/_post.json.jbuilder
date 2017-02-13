json.extract! post, :id, :caption, :original_file_name, :file_name, :file_content_type, :file_updated_at, :user_id, :created_at, :updated_at
json.url post_url(post, format: :json)
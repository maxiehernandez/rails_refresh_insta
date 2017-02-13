class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :caption
      t.string :original_file_name
      t.string :file_name
      t.string :file_content_type
      t.datetime :file_updated_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

class CreatePostscomments < ActiveRecord::Migration[5.1]
  def change
    create_table :postscomments do |t|
      t.string :comtext
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end
end

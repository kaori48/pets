class CreateBlogComments < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_comments do |t|
      t.integer  :user_id
      t.integer  :blog_id
      t.string   :blog_comment
      t.timestamps
      t.references :user_id, foreign_key: true
      t.references :blog_id, foreign_key: true
    end
  end
end

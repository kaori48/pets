class CreateBlogComments < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_comments do |t|
      t.references :user, foreign_key: true
      t.references :blog, foreign_key: true
      t.string :comment
      t.timestamps
    end
  end
end

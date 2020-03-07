class CreateBlogGenreRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_genre_relations do |t|
      t.integer :blog_id
      t.integer :genre_id

      t.timestamps
    end
  end
end

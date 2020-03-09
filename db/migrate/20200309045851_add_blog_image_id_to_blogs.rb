class AddBlogImageIdToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :blog_image_id, :string
  end
end

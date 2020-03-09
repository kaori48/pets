class RenamePostImageIdColumnToBlogComments < ActiveRecord::Migration[5.2]
  def change
  	rename_column :blog_comments, :post_image_id, :blog_id
  end
end

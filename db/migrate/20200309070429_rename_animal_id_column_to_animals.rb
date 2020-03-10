class RenameAnimalIdColumnToAnimals < ActiveRecord::Migration[5.2]
  def change
  	rename_column :animals, :animal_id, :animal_image_id
  end
end

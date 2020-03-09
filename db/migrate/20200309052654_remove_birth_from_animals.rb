class RemoveBirthFromAnimals < ActiveRecord::Migration[5.2]
  def change
    remove_column :animals, :birth, :string
  end
end

class AddBirthToAnimals < ActiveRecord::Migration[5.2]
  def change
    add_column :animals, :birth, :date
  end
end

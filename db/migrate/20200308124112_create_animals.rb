class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.integer :user_id
      t.string :animal_id
      t.string :name
      t.string :birth
      t.text :food
      t.text :toilet
      t.text :water
      t.text :hospital
      t.text :other
      t.timestamps
    end
  end
end

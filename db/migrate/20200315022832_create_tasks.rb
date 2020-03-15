class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :content
      t.boolean :done,default: false
      t.integer :animal_id
      t.timestamps
    end
  end
end

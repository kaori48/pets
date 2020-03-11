class CreateAnimalPermits < ActiveRecord::Migration[5.2]
  def change
    create_table :animal_permits do |t|
    	t.integer :permitter_id
    	t.integer :permitted_id
    	t.boolean :is_permit, default: false

      t.timestamps
    end
    add_index :animal_permits, :permitter_id
    add_index :animal_permits, :permitted_id
    add_index :animal_permits, :is_permit
    add_index :animal_permits, [:permitter_id, :permitted_id], unique: true
  end
end

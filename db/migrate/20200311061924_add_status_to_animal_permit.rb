class AddStatusToAnimalPermit < ActiveRecord::Migration[5.2]
  def change
    add_column :animal_permits, :status, :integer ,default: 0, null: false,limit: 1
  end
end

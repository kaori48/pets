class RemoveIsPermitFromAnimalPermit < ActiveRecord::Migration[5.2]
  def change
    remove_column :animal_permits, :is_permit, :boolean
  end
end

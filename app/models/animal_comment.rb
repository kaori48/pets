class AnimalComment < ApplicationRecord
	belongs_to :user
	belongs_to :animal
end

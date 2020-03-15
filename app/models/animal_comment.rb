class AnimalComment < ApplicationRecord
	belongs_to :user
	belongs_to :animal
	validates :comment,presence: true #空欄NG
end

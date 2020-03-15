class Task < ApplicationRecord
	belongs_to :animal
	validates :content, presence: true #空欄NG
end

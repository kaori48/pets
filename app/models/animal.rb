class Animal < ApplicationRecord
	belongs_to :user
	attachment :animal_image #refile,id入れない
end

class Tag < ApplicationRecord
	has_many :posts
	enum month_name: ["January", "February", "March", "April", "May","June", "July", "August", "September", "October", "November","December"]
end

class Post < ApplicationRecord
	mount_uploader :photo, PhotoUploader
	has_many :tags
end

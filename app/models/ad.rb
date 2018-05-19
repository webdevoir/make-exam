class Ad < ApplicationRecord

	serialize :countries
	serialize :months
	serialize :age

	mount_uploader :image, ImageUploader
end

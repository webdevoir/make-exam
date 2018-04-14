class Ad < ApplicationRecord

	serialize :countries
	serialize :months

	mount_uploader :image, ImageUploader
end

class Ad < ApplicationRecord

	serialize :countries
	serialize :months
	serialize :age

	has_many :payments

	mount_uploader :image, ImageUploader

	validates_presence_of :compname
	validates_presence_of :email
	validates_presence_of :contact
	validates_presence_of :countries
	validates_presence_of :months
	validates_presence_of :age
	validates_presence_of :image
	validates_presence_of :url

end

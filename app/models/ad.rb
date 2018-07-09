class Ad < ApplicationRecord

	
	before_validation :make_placements

	serialize :countries
	serialize :months
	serialize :age

	has_many :payments
	has_and_belongs_to_many :placements

	mount_uploader :image, ImageUploader

	validates_presence_of :compname
	validates_presence_of :email
	validates_presence_of :contact
	validates_presence_of :countries
	validates_presence_of :months
	validates_presence_of :age
	validates_presence_of :image
	validates_presence_of :url


	def make_placements
	    self.countries.each do |country|
	      if country.length > 0
		      self.age.each do |age|
		        if age.length > 0
			        self.months.each do |month|
			          if month.length > 0
			          	place = Placement.find_by(country: country, month: month, age: age)
			          	if place
			          		# self.placement_ids.push(place.id)
			          		unless self.placements.include?(place)
			          			self.placements << place
			          			self.save
			          		end
			          	else
				            place = Placement.create(month: month, country: country, age: age)
				            # place.save
				            # self.placement_ids.push(place.id)
				            unless self.placements.include?(place)
					            self.placements << place
					            self.save
					        end
				        end
			            # place.errors.messages
			          end
			      	end
		      	end
			  end
		  end
	  	end
	end
	
end



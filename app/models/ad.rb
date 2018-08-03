class Ad < ApplicationRecord

	
	before_validation :make_placements
	

	serialize :countries
	serialize :months
	serialize :age
	serialize :pages

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
	validate :check_placements

	# attr_accessor :pages

	def make_placements
		placements = {}
		pages_fix = []
		countries_fix = []
		months_fix = []
		age_fix = []
		self.pages.each do |page|
			if page.length > 0
				pages_fix.push(page)
			end
		end
		self.countries.each do |country|
			if country.length > 0
				countries_fix.push(country)
			end
		end
		self.age.each do |age|
			if age.length > 0
				age_fix.push(age)
			end
		end
		self.months.each do |month|
			if month.length > 0
				months_fix.push(month)
			end
		end
		placements[:pages] = pages_fix
		placements[:countries] = countries_fix
		placements[:months] = months_fix
		placements[:ages] = age_fix
		test = product_hash(placements)
		check_make_placements(test)
		# self.save
	end

	def product_hash(hsh)
	  attrs   = hsh.values
	  keys    = hsh.keys
	  product = attrs[0].product(*attrs[1..-1])
	  product.map{ |p| Hash[keys.zip p] }
	end

	def check_make_placements(arr)
		place_new = []
		arr.each do |place_data|
			country = place_data[:countries]
			month = place_data[:months]
			age = place_data[:ages]
			page = place_data[:pages]
			place = Placement.find_by(country: country, month: month, age: age, page: page)

	      		unless place
	            	newplace = Placement.create(month: month, country: country, age: age, page: page)

	            	place_new.push(newplace.id)
	            end

	            place_new.push(place.id)

	    end
	    place_new.each do |new|
	    	test = Placement.find(new)
	     	unless self.placements.include?(test)
	            self.placements << test
			end
		end
	end


	def check_placements
    	self.placements.each do |place|
    		count = place.ads.count
    		if count >= 10
    			errors.add(:placement, "We only allow 10 ads per placement.  The spot for: #{place.country}, #{place.age}, #{place.month}, is already filled")
    		end
    	end

	end
	
end



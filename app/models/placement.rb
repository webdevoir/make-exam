class Placement < ApplicationRecord
	has_and_belongs_to_many :ads
	validates :country, uniqueness: { scope: [:month, :age] }

	# validate :unique_attrs

 #  def unique_attrs
 #    if Placement.where(country: country, month: month, age: age)

 #      errors.add(:expiration_date, "can't be in the past")
 #    end # this end you missed in code
 #  end
end

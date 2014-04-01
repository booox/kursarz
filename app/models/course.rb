class Course < ActiveRecord::Base
	validates :short_description, length: { maximum: 500 }
	validates :short_description, length: { maximum: 8000}
end

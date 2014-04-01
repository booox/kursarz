class Course < ActiveRecord::Base

	validates :short_description, length: { maximum: 500 }
	validates :short_description, length: { maximum: 8000}

  acts_as_url :name

  def to_parm
    url
  end

end

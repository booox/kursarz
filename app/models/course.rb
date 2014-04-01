class Course < ActiveRecord::Base
  acts_as_url :name

  def to_parm
    url
  end
end

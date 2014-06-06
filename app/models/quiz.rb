class Quiz < ActiveRecord::Base
  belongs_to :course
  has_many :questions

  accepts_nested_attributes_for :questions

  def screenshot_url
    # super || "holder.js/750x563/auto/sky/text:#{name}"
  end
end

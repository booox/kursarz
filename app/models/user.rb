class User < ActiveRecord::Base
  def logged_in?
    true
  end
end

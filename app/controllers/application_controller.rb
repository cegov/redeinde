class ApplicationController < ActionController::Base
  protect_from_forgery except: :verify_user
  before_filter :get_courses
  
  def verify_user
    username = params['refinery_user']['username']
    password = params['refinery_user']['password']
    user = Refinery::User.find_by_username(username)
    if !user.nil? and  user.valid_password?(password)
      head :ok
    else 
      head :bad_request
    end
  end
  
  def get_courses
    @courses = nil 
  end
  
end

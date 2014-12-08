class ApplicationController < ActionController::Base
  protect_from_forgery except: :verify_user  
  
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
  
  def get_sitemap
    # @page = ::Refinery::Page.where(:link_url => "/newsarticles").first # gambiarra para definir o template usado
    @newsarticles = Refinery::Newsarticles::Newsarticle.where(is_published: true).last(30)
    @pages = Refinery::Page.where show_in_menu: true    
    respond_to do |format|
      format.html {       
        render "sitemap/sitemap", layout: true
      }
      format.xml { render "sitemap/index.xml" }
    end        
  end
  
end

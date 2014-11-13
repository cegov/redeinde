ApplicationController.class_eval do
  
  # before_filter :find_newsarticles, :only => "home"
  # before_filter :find_courses, :only => "home"
  before_filter :find_pages_for_sidebar_menu
  
  public    
    def find_pages_for_sidebar_menu
      # @sobre = Refinery::Page.find('sobre')        
    end    
end
Refinery::PagesController.class_eval do
  
    before_filter :find_newsarticles, :only => "home"
    # before_filter :find_courses, :only => "home"    
    
    MAX_NEWS_AT_HOME_PAGE = 3
    MAX_COURSES_AT_HOME_PAGE = 3
          
    protected
      def find_newsarticles
        @highlight = Refinery::Newsarticles::Newsarticle
          .where(:is_published => true)
          .where(:is_a_highlight => true).first || Refinery::Newsarticles::Newsarticle.last
        @news_for_carousel = Refinery::Newsarticles::Newsarticle.last(5).reverse
        @last_newsarticles = Refinery::Newsarticles::Newsarticle          
          .limit(MAX_NEWS_AT_HOME_PAGE)
          .order("created_at DESC")
          # .where(:is_a_highlight => false) # this is irrelevant now :/
      end
      
      
end
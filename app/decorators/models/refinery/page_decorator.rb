Refinery::Page.class_eval do
  attr_accessible :show_in_sidebar
  
  # DONT FORGET TO REINDEX IF CHANGED! :  Refinery::Newsarticles::Newsarticle.reindex
  searchable do
    text :title
  end
  
  def self.fulltext_search query_string
    Refinery::Page.search do
      fulltext query_string      
    end
  end
  
  def self.menu_pages
    where :show_in_menu => true
  end
end
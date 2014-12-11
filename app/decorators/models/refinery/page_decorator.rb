Refinery::Page.class_eval do
  attr_accessible :show_in_sidebar
  
  def self.menu_pages
    where :show_in_menu => true
  end
end
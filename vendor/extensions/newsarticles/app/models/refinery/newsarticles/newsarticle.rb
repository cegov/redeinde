module Refinery
  module Newsarticles
    class Newsarticle < Refinery::Core::BaseModel
      
      MAX_NEWSARTICLES_IN_MENU = 10
      MAX_HIGHLIGHTS = 1
      
      self.table_name = 'refinery_newsarticles'      

      attr_accessible :refinery_user_id, :headline, :lead, :byline, 
        :photo_id, :story, :event_date, :is_published, :position, :is_a_highlight

      validates :headline, :presence => true, :uniqueness => true
      after_validation :one_highlight_only
      after_save :check_hightlights_limit
      
      belongs_to :photo, :class_name => '::Refinery::Image'
      
      def self.get_pages_in_menu
        # to use this:  Refinery::Newsarticles::Newsarticle.get_pages_in_menu
        Refinery::Newsarticles::Newsarticle.where(:is_published => true).limit(MAX_NEWSARTICLES_IN_MENU)
      end
      
      def self.count_highlights
        Refinery::Newsarticles::Newsarticle.where(:is_a_highlight => true).size
      end
      
      private
        #validations
        def one_highlight_only
          if self.is_a_highlight?
            old_highlight = Refinery::Newsarticles::Newsarticle.where(:is_a_highlight => true).first
            if !old_highlight.blank?              
              old_highlight.is_a_highlight = false
              old_highlight.save  
            end
          end
        end
        def check_hightlights_limit
          if Refinery::Newsarticles::Newsarticle.count_highlights > MAX_HIGHLIGHTS
            errors.add(:base, "Só pode haver um highlight para notícias e eventos")
          end
        end
        
    end
  end
end

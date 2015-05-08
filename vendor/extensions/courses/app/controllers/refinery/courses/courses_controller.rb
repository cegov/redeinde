module Refinery
  module Courses
    class CoursesController < ::ApplicationController

      before_filter :find_all_courses
      before_filter :find_page
      before_filter :find_all_newsarticles  
      
      MAX_COURSES_PER_PAGE = 20
      
      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @course in the line below:
        present(@page)
      end

      def show
        @course = Course.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @course in the line below:
        present(@page)
      end

    protected
      def find_all_newsarticles
        @newsarticles = Refinery::Newsarticles::Newsarticle.get_pages_in_menu 
      end
      
      
      def find_all_courses
        @courses = Course.order('position ASC').page(params[:page]).per_page(MAX_COURSES_PER_PAGE)
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/courses").first
      end
      
    end
  end
end

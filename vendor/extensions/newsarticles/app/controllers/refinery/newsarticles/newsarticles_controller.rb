module Refinery
  module Newsarticles
    class NewsarticlesController < ::ApplicationController

      before_filter :find_all_newsarticles
      before_filter :find_page     
      
      MAX_NEWSARTICLES_PER_PAGE = 20

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @newsarticle in the line below:
        present(@page)
      end

      def show
        @newsarticle = Newsarticle.find(params[:id])
        @lastarticles = Newsarticle.last(5).reverse

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @newsarticle in the line below:
        present(@page)
      end
      
      def events
        @newsarticle = Newsarticle.all

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @newsarticle in the line below:
        present(@page)
      end

    protected

      def find_all_newsarticles
        @newsarticles = Newsarticle.order('position DESC').page(params[:page]).per_page(MAX_NEWSARTICLES_PER_PAGE)
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/newsarticles").first
      end

    end
  end
end

module Refinery
  module Faqs
    module Admin
      class FaqsController < ::Refinery::AdminController

        crudify :'refinery/faqs/faq',
                :title_attribute => 'question',
                :xhr_paging => true

      end
    end
  end
end

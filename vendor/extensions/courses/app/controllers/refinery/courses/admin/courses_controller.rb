module Refinery
  module Courses
    module Admin
      class CoursesController < ::Refinery::AdminController
        
        crudify :'refinery/courses/course',
                :title_attribute => 'name',
                :xhr_paging => true
        before_filter :change_params_to_add_current_user_id, :only => [:create]
        
        private
          def change_params_to_add_current_user_id
            logger.debug "Heeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeey"
            logger.debug current_refinery_user.email
            params['course']['user_id'] = current_refinery_user.id 
          end
      end
    end
  end
end

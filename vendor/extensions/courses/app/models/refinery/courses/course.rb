module Refinery
  module Courses
    class Course < Refinery::Core::BaseModel
      self.table_name = 'refinery_courses'
      belongs_to :refinery_user, :foreign_key => :user_id
      belongs_to :photo, :class_name => '::Refinery::Image'

      attr_accessible :name, :user_id, :teacher_name, :is_active, 
        :description, :duration, :classes_start_on, :classes_end_on, 
        :position, :photo_id

      validates :name, :presence => true, :uniqueness => true
    end
  end
end

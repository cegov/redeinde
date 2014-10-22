module Refinery
  module Faqs
    class Faq < Refinery::Core::BaseModel
      self.table_name = 'refinery_faqs'

      attr_accessible :refinery_user_id, :question, :answer, :is_published, :position

      validates :question, :presence => true, :uniqueness => true
    end
  end
end

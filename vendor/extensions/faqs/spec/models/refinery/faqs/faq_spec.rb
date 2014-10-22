require 'spec_helper'

module Refinery
  module Faqs
    describe Faq do
      describe "validations" do
        subject do
          FactoryGirl.create(:faq,
          :question => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:question) { should == "Refinery CMS" }
      end
    end
  end
end

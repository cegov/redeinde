# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Faqs" do
    describe "Admin" do
      describe "faqs" do
        refinery_login_with :refinery_user

        describe "faqs list" do
          before do
            FactoryGirl.create(:faq, :question => "UniqueTitleOne")
            FactoryGirl.create(:faq, :question => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.faqs_admin_faqs_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.faqs_admin_faqs_path

            click_link "Add New Faq"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Question", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Faqs::Faq.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Question can't be blank")
              Refinery::Faqs::Faq.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:faq, :question => "UniqueTitle") }

            it "should fail" do
              visit refinery.faqs_admin_faqs_path

              click_link "Add New Faq"

              fill_in "Question", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Faqs::Faq.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:faq, :question => "A question") }

          it "should succeed" do
            visit refinery.faqs_admin_faqs_path

            within ".actions" do
              click_link "Edit this faq"
            end

            fill_in "Question", :with => "A different question"
            click_button "Save"

            page.should have_content("'A different question' was successfully updated.")
            page.should have_no_content("A question")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:faq, :question => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.faqs_admin_faqs_path

            click_link "Remove this faq forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Faqs::Faq.count.should == 0
          end
        end

      end
    end
  end
end

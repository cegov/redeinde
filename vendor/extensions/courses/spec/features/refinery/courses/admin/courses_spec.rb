# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Courses" do
    describe "Admin" do
      describe "courses" do
        refinery_login_with :refinery_user

        describe "courses list" do
          before do
            FactoryGirl.create(:course, :name => "UniqueTitleOne")
            FactoryGirl.create(:course, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.courses_admin_courses_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.courses_admin_courses_path

            click_link "Add New Course"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Courses::Course.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Courses::Course.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:course, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.courses_admin_courses_path

              click_link "Add New Course"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Courses::Course.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:course, :name => "A name") }

          it "should succeed" do
            visit refinery.courses_admin_courses_path

            within ".actions" do
              click_link "Edit this course"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:course, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.courses_admin_courses_path

            click_link "Remove this course forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Courses::Course.count.should == 0
          end
        end

      end
    end
  end
end

class AddPhotoToRefineryCourses < ActiveRecord::Migration
  def change
    add_column :refinery_courses, :photo_id, :integer, :default => nil
  end
end

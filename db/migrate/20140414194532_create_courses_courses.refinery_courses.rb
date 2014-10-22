# This migration comes from refinery_courses (originally 1)
class CreateCoursesCourses < ActiveRecord::Migration

  def up
    create_table :refinery_courses do |t|
      t.string :name
      t.integer :user_id
      t.string :teacher_name
      t.boolean :is_active
      t.text :description
      t.string :duration
      t.date :classes_start_on
      t.date :classes_end_on
      t.integer :position

      t.timestamps
    end
    add_index :refinery_courses, :user_id
  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-courses"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/courses/courses"})
    end
    
    remove_index :refinery_courses, :user_id
    drop_table :refinery_courses
  end

end

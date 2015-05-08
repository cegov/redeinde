# This migration comes from refinery_faqs (originally 1)
class CreateFaqsFaqs < ActiveRecord::Migration

  def up
    create_table :refinery_faqs do |t|
      t.integer :refinery_user_id
      t.string :question
      t.string :answer
      t.boolean :is_published
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-faqs"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/faqs/faqs"})
    end

    drop_table :refinery_faqs

  end

end

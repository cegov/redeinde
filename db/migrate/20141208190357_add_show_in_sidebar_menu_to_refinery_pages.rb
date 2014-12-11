class AddShowInSidebarMenuToRefineryPages < ActiveRecord::Migration
  def change
    add_column :refinery_pages, :show_in_sidebar, :boolean, :default => false
  end
end

class AddIsAHighlightToRefineryNewsarticles < ActiveRecord::Migration
  def change
    add_column :refinery_newsarticles, :is_a_highlight, :boolean, :default => false
  end
end

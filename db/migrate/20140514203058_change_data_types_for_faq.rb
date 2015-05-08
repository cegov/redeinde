class ChangeDataTypesForFaq < ActiveRecord::Migration  
  def self.up    
    change_column :refinery_faqs, :answer, :text    
  end
  def self.down    
    change_column :refinery_faqs, :answer, :string
  end
end

class AddTitleToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :title, :string 
  end
end

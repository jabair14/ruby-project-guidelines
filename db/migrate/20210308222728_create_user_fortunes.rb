class CreateUserFortunes < ActiveRecord::Migration[6.1]
  def change
    create_table :user_fortunes do |t|
      t.integer :user_id
      t.integer :quote_id
    
    end
  end
end

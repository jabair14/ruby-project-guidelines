class Quote < ActiveRecord::Base
    has_many :user_fortunes 
    has_many :users, through: :user_fortunes 
end
class Bookmark < ApplicationRecord
    validates :title, :link, presence: true
end 

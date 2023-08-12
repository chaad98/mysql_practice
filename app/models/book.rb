class Book < ApplicationRecord
    validates_presence_of :author, :title
end

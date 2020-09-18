class Hotel < ApplicationRecord
  belongs_to :Category
  has_many :Roomtypes
end

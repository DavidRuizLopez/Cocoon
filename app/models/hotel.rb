class Hotel < ApplicationRecord
  belongs_to :Category
  has_many :Roomtypes

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

class Room < ApplicationRecord
    mount_uploader :hotel, HotelUploader

    validates :value,numericality: {greater_than_or_equal_to: 1}, presence: true
    validates :name, presence: true
    validates :introduction, presence: true
    validates :address, presence: true
end

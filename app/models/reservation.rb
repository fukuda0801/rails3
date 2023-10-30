class Reservation < ApplicationRecord
    belongs_to :room
    belongs_to :user

    validates :checkin, presence: true
    validates :checkout, presence: true
    validates :number, numericality: {greater_than_or_equal_to: 1}, presence: true
    validate :date_today
    validate :date_after

    def date_today
        if checkin < Time.zone.today
            errors.add(:checkin, "を本日以降の日付を選択してください")
        end 
    end 

    def date_after
        if checkin > checkout
            errors.add(:checkout, "はチェックイン以降の日付を選択してください")
        end 
    end 

end

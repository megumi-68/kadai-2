class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :checkin, presence: true
  validates :checkout, presence: true
  validates :person, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validate :check_in_after_today
  validate :check_out_after_check_in

  def stay_duration
    if checkin.present? && checkout.present?
      (checkout - checkin).to_i
    end
  end

  def total_price
    if checkin.present? && checkout.present? && person.present?
      stay_duration * person * room.price
    end
  end

  private
  def check_in_after_today
    if checkin.present? && checkin < Date.today
      errors.add(:checkin, 'は本日以降の日付にしてください。')
    end
  end

  def check_out_after_check_in
    if checkout.present? && checkout <= checkin
      errors.add(:checkout, 'はチェックイン日より後の日付にしてください。')
    end
  end
end

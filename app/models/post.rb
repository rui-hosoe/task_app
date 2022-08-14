class Post < ApplicationRecord
 validates :title ,presence: true
 validates :start_date ,presence: true
 validates :end_date ,presence: true
 validate :date_before_todeay


 def date_before_todeay
  return if end_date.blank?
  errors.add(:end_date, "は今日以降のものを選択してください") if end_date < Date.today
 end

end

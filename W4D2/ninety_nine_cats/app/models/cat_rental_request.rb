# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
    validates :status, presence: true, inclusion: {in: ["PENDING", "APPROVED", "DENIED"]}
    validates :cat_id, :start_date, :end_date, presence: true

    belongs_to :cat,
        primary_key: :id,
        foreign_key: :cat_id,
        class_name: :Cat
    
    def overlapping_requests
        overlapping = CatRentalRequest.select(*).where(self.start_date <= :end_date)
    end
end

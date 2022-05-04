class Company < ApplicationRecord
    validates :name, presence: true,
    validates :description, presence: true

    has_many :job_offers, dependent: :destroy
end
class Candidate < ApplicationRecord
    validates :name, presence: true,
    validates :lastName, presence: true,
    validates :age, presence: false

    has_many :job_applications, dependent: :destroy
    has_many :job_offers, through: :job_applications
end
class JobOffer < ApplicationRecord
    validates :title, presence: true,
    validates :description, presence: true

    belongs_to :company
    has_many :job_applications, dependent: :destroy
    has_many :candidates, through: :job_applications
end

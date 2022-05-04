class JobApplication < ApplicationRecord
    enum statuses: {pendiente: 0, rechazado: 1, interesa: 2, contratado: 3}

    belongs_to :job_offer
    belongs_to :candidate
end
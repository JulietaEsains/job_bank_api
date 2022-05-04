class Candidate < ApplicationRecord
    #Relaciones
    has_many :job_applications, dependent: :destroy
    has_many :job_offers, through: :job_applications

    #Validaciones
    validates :name, presence: true,
    validates :lastName, presence: true,
    validates :age, presence: false
    validates :token, uniqueness: true

    #Métodos
    def set_token
        self.token = SecureRandom.uuid
    end
end
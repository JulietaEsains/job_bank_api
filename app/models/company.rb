class Company < ApplicationRecord
    #Relaciones
    has_many :job_offers, dependent: :destroy

    #Validaciones
    validates :name, presence: true,
    validates :description, presence: true
    validates :token, uniqueness: true

    #Callbacks
    before_create :set_token

    #Métodos
    def set_token
        self.token = SecureRandom.uuid
    end
end
class Planet < ApplicationRecord
    has_many :missions, dependent: :destroy
    has_many :scientists, through: :missions

    def index
        render json: Planet.all
    end
end

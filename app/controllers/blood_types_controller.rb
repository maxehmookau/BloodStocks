class BloodTypesController < ApplicationController

  respond_to :json
  def index
    @blood_types = BloodType.all
    render json: @blood_types.to_json(only: [:id], methods: [:name])
  end

end

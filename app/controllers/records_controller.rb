class RecordsController < ApplicationController

  respond_to :json
  def index
    @records = Record.where(authority: params[:authority].capitalize)
    render json: @records.to_json(only: [:blood_type_id, :days_remaining, :authority])
  end

end

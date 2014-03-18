class RecordsController < ApplicationController

  respond_to :json
  def index
    @records = Record.where(authority: params[:authority])
    render json: @records.to_json(except: [:updated_at])
  end

end

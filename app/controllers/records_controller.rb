class RecordsController < ApplicationController

  respond_to :json
  def index
    if params[:all] == 'true'
      @records = Record.where(authority: params[:authority])
    else
      @records = Record.where(authority: params[:authority]).last 8
    end
    render json: @records.to_json(except: [:updated_at])
  end

end

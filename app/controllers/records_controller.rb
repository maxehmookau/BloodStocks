class RecordsController < ApplicationController

  respond_to :json
  def index
    @records = Record.where(authority: params[:authority].capitalize).last 8
    render json: @records.to_json(except: [:updated_at])
  end

end

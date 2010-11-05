class SourcesController < ApplicationController
  # GET /assets/1/sources/1
  def show
    @source = Source.find(params[:id])

    send_file "#{RAILS_ROOT}/public/assets/#{@source.filename}"
  end

end

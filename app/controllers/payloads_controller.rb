class PayloadsController < ApplicationController
  def create
    @payload = Payload.new(payload_params)

    if @payload.save
      analyzed_result = AnalyzePayloadService.call(payload: @payload)
      @payload.update(analyzed_result:)

      flash[:notice] = "Rating submitted & analyzed successfully!"
      redirect_to payload_path(@payload)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @payload = Payload.new
  end

  def show
    @payload = Payload.find(params[:id])

    render :show
  end

  private

  def payload_params
    params.require(:payload).permit!
  end
end

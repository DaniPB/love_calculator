class LoveCalculationsController < ApplicationController
  def show
    if show_params[:lover_name]
      score = rand().round(2)

      calculation_result = {
        score: score,
        message: "Dear #{show_params[:lover_name]}, your love capacity is #{score}"
      }

      render json: calculation_result, status: :ok
    else
      error_result = { message: 'Please provide me with a name' }

      render json: error_result, status: :bad_request
    end
  end

  private

  def show_params
    params.permit(:lover_name)
  end
end

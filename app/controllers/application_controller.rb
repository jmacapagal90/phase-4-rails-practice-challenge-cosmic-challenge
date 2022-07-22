class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
    rescue_from ActiveRecord::RecordInvalid, :with => :render_invalid
  

  private
  
  def render_not_found
    render json: {error: "Scientist not found"},status: :not_found
  end

  def render_invalid(i)
    render json: {errors: i.record.errors.full_messages}, status: :unprocessable_entity
  end
end

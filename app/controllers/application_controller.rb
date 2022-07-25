class ApplicationController < ActionController::API
rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    private

    def record_invalid(i)
        render json: {errors: i.record.errors.full_messages}, status: :unprocessable_entity
    end

    def record_not_found
        render json: {error: "Scientist not found"}, status: :not_found
    end

end

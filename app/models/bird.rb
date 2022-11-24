class Bird < ApplicationRecord
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    # added rescue_from
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  
    # rest of controller actions...
  
    private
  
    def render_unprocessable_entity_response(invalid)
      render json: {
               errors: invalid.record.errors
             },
             status: :unprocessable_entity
    end
  end

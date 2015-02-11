module CarrierwaveIosRails
  class API::V1::ApiController < ActionController::Base
    respond_to :json

    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    decent_configuration do
      strategy DecentExposure::StrongParametersStrategy
    end

    private

    def record_not_found
      render json: { errors: I18n.t('errors.record_not_found') }, status: :not_found
    end
  end
end

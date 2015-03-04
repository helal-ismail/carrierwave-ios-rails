module CarrierwaveIosRails
  class API::V1::AttachmentsController < API::V1::ApiController
    respond_to :json

    expose(:attachment, attributes: :attachment_params, model: Attachment)
    expose(:attachments) { Attachment.all }

    def index
      respond_with attachments, status: :ok
    end

    def show
      respond_with attachment, status: :ok
    end

    def download
      data = attachment.file_data
      response.headers['Content-Length'] = data.size.to_s
      send_data data,
        filename: attachment.filename,
        disposition: 'attachment',
        status: :ok
    end

    def create
      if attachment.save
        response.location = api_v1_attachment_url attachment
        respond_with :api, :v1, attachment, status: :created
      else
        render json: { errors: attachment.errors }, status: :unprocessable_entity
      end
    end

    def destroy
      status = attachment.destroy ? :ok : :unprocessable_entity
      head status
    end

    def supported_extensions
      render json: FileUploader.supported_extensions.to_json
    end

    private

    def attachment_params
      params.require(:attachment).permit(:file)
    end
  end
end

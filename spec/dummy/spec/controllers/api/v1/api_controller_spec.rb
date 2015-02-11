require 'spec_helper'

module CarrierwaveIosRails
  describe API::V1::ApiController do
    controller do
      def index
        raise ActiveRecord::RecordNotFound
      end
    end

    describe 'handling ActiveRecord::RecordNotFound' do
      before { get :index }

      it 'returns 404 status' do
        expect(response.status).to eq 404
      end
    end
  end
end

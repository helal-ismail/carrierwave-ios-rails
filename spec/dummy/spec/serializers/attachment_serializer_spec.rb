require 'spec_helper'

module CarrierwaveIosRails
  describe AttachmentSerializer, type: :serializer  do

    let(:attachment) { create :attachment }
    subject(:serializer) { described_class.new(attachment).serializable_hash }

    it { should have_key(:id) }
    it { should have_key(:file_url) }

  end
end

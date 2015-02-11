require 'spec_helper'
require 'carrierwave/test/matchers'

module CarrierwaveIosRails
  describe FileUploader do
    include CarrierWave::Test::Matchers

    let(:attachment) { create :attachment }
    subject { FileUploader.new(attachment, :attachment) }

    after { subject.remove! }

    describe 'file path' do
      it 'is separated for each environment' do
        test_env = subject.store_dir

      # stub Rails.env to return 'production'
      allow(Rails).to receive(:env) { ActiveSupport::StringInquirer.new('production') }

      prod_env = subject.store_dir

      expect(test_env).to_not eq(prod_env)
    end

    it 'contains model name and id' do
      expect(subject.store_dir).to include('attachment')
      expect(subject.store_dir).to include(attachment.id.to_s)
    end

    context "Change default white list extensions"
    it "contains only specified extensions in initializer" do
      expect(subject.extension_white_list).to eq(%w(jpg jpeg mp3))
    end
  end
end
end

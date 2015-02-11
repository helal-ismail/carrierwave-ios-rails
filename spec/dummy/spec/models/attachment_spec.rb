require 'spec_helper'
module CarrierwaveIosRails

  describe Attachment do
    subject(:attachment) { build :attachment }
    let(:empty_attachment) { build :attachment, file: nil }

    it { is_expected.to be_valid }

    describe 'validations' do
      subject { described_class.new }

      it { is_expected.to validate_presence_of :file }
    end

    describe '#filename' do
      context 'when no file present' do
        it 'returns nil' do
          expect(empty_attachment.filename).to be_nil
        end
      end

      context 'when file present' do
        it 'returns it\'s name' do
          expect(subject.filename).to eq 'netguru.jpg'
        end
      end
    end

    describe '#file_data' do
      context 'when no file present' do
        it 'returns nil' do
          expect(empty_attachment.file_data).to be_nil
        end
      end

      context 'when file present' do
        it 'returns file\'s data' do
          expect(subject.file_data).to eq subject.file.read
        end
      end
    end
  end
end

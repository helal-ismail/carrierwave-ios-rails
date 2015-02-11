module CarrierwaveIosRails
  FactoryGirl.define do
    factory :attachment, class: CarrierwaveIosRails::Attachment do
      file Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/netguru.jpg")
    end

    factory :unsupported_attachment,  class: CarrierwaveIosRails::Attachment do
      file Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/unsupported_file.bad")
    end
  end
end

module CarrierwaveIosRails
  class Attachment < ActiveRecord::Base
    mount_uploader :file, FileUploader

    validates :file, presence: true

    def filename
      return unless file.present?
      File.basename(file.path)
    end

    def file_data
      return unless file.present?
      file.read
    end

  end
end

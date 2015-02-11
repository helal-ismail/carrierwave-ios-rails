require CarrierwaveIosRails::Engine.root.join('app', 'uploaders','file_uploader')
class FileUploader
  def self.supported_extensions
    %w(jpg jpeg mp3)
  end
end

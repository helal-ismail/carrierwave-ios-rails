# encoding: utf-8

class FileUploader < CarrierWave::Uploader::Base
  # Override the directory where uploaded files will be stored.
  def store_dir
    "uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{model.id}"
  end

  # Add a white list of extensions which are allowed to be uploaded.
  def extension_white_list
    if FileUploader.respond_to?(:supported_extensions)
      FileUploader.supported_extensions
    else
      FileUploader.default_extensions
    end
  end

  class << self
    def default_extensions
      default_video_extensions + default_audio_extensions + default_image_extensions
    end

    def default_video_extensions
      %w(asf avi dvr-ms m1v m4v mp2 mp2v mp4 mpe mpeg mpg mpv2 wm wmv)
    end

    def default_audio_extensions
      %w(acc aif aifc aiff asf au flac m4v mp2 mp3 mpa snd wav wma)
    end

    def default_image_extensions
      %w(bmp dib emf gif jfif jpe jpeg jpg png tif tiff wmf)
    end
  end
end

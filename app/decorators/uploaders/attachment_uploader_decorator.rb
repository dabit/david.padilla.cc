AttachmentUploader.class_eval do
  include CarrierWave::MiniMagick

  process resize_to_limit: [820, 700]
end

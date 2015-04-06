CarrierWave.configure do |config|
  config.permissions = 0666
  config.directory_permissions = 0777
  config.storage = :file
end

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['AWS_KEY'],
      aws_secret_access_key: ENV['AWS_SECRET']
    }
    config.fog_directory  = ENV['AWS_BUCKET']
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
    config.storage = :fog
  end
end

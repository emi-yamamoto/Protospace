CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Settings.s3.access_key,
    aws_secret_access_key: Settings.s3.secret_key,
    region: 'us-east-1'
  }

    case Rails.env
    when 'development'
        config.fog_directory  = 'protospace-images'
        config.asset_host = 'https://s3.amazonaws.com/protospace-images'
        config.storage = :fog
    when 'production'
        config.fog_directory  = 'protospace-pro-images'
        config.asset_host = 'https://s3.amazonaws.com/protospace-pro-images'
        config.storage = :fog
    when 'test'
        config.storage = :file
    end
end

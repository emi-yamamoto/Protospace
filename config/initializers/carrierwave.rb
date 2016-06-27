CarrierWave.configure do |config|
    config.storage = :fog
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
    when 'production'
        config.fog_directory  = 'protospace-images'
        config.asset_host = 'https://s3.amazonaws.com/protospace-images'
    when 'test'
        config.storage = :file
    end
end

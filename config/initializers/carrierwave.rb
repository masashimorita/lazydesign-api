if Rails.env.test? || Rails.env.development?
  CarrierWave.configure do |config|
    config.storage = :file
  end
else
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_credentials = {
        :provider               => 'AWS',
        :aws_access_key_id      => Rails.application.credentials[:aws][:access_key_id],
        :aws_secret_access_key  => Rails.application.credentials[:aws][:secret_access_key],
        :region                 => Settings["aws"]["region"],
        :host                   => Settings["aws"]["host"]
    }
    config.asset_host = Settings["aws"]["asset_host"]
    config.fog_directory = Settings["aws"]['bucket']
    config.fog_public    = true
  end
end

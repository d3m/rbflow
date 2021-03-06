require 'openid/store/filesystem'

config = YAML.load_file(File.join(Rails.root, "config", "omniauth.yml"))[Rails.env].symbolize_keys

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :open_id, OpenID::Store::Filesystem.new('/tmp')
  
  config.each_pair do |name, consumer|
    provider name, consumer["key"], consumer["secret"]
  end
end
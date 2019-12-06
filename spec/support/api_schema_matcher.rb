require "yaml"
RSpec::Matchers.define :match_response_schema do |schema|
  match do |response|
    schema_directory = "#{Rails.root}/spec/support/api/schemas"
    schema_path = "#{schema_directory}/#{schema}.yaml"
    schema = YAML.load(File.read(schema_path))
    JSON::Validator.validate!(schema, response.body, strict: true)
  end
end

FactoryBot.define do
  factory :deploy_method do
    sequence(:deploy_method_id) { |i| default_deploy_method_id || i }
    deploy_method_name          { default_deploy_method_name }
    deploy_program              { default_deploy_program }
    entry_point                 { default_entry_point }

    transient do
      default_deploy_method_id { nil }
      default_deploy_method_name { "SFTP" }
      default_deploy_program { "SftpFIleTransfer" }
      default_entry_point { "sample" }
    end
  end
end

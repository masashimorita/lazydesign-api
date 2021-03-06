class Project < ApplicationRecord
  self.primary_key = :project_id
  include GenerateUlid

  belongs_to :product_type, primary_key: :product_type_id, foreign_key: :product_type_id
  belongs_to :template, primary_key: :template_id, foreign_key: :template_id
  belongs_to :user, primary_key: :user_id, foreign_key: :user_id
  belongs_to :project_status, primary_key: :project_status_id, foreign_key: :project_status_id
  belongs_to :project_group, primary_key: :project_group_id, foreign_key: :project_group_id
  belongs_to :deploy_method, primary_key: :deploy_method_id, foreign_key: :deploy_method_id
  has_many :configurations, as: :configurator, dependent: :destroy
  has_many :pages, as: :container, dependent: :destroy
  has_many :deploy_histories, primary_key: :project_id, foreign_key: :project_id, dependent: :destroy
  has_one :domain, primary_key: :project_id, foreign_key: :project_id

  validates :project_name, presence: true
  validates :is_on_trial, allow_blank: true, inclusion: [true, false]
end

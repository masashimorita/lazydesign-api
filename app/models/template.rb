class Template < ApplicationRecord
  self.primary_key = :template_id
  include GenerateUlid
  before_destroy :deletable?

  has_many :projects, primary_key: :template_id, foreign_key: :template_id
  has_many :template_infos, primary_key: :template_id, foreign_key: :template_id, dependent: :destroy
  has_many :template_parts, through: :template_infos, source: :template_part
  has_many :templates_tags, primary_key: :template_id, foreign_key: :template_id, dependent: :destroy
  has_many :tags, through: :templates_tags, source: :tag
  has_many :configurations, as: :configurator, dependent: :destroy
  has_many :pages, as: :container, dependent: :destroy
  belongs_to :product_type, primary_key: :product_type_id, foreign_key: :product_type_id

  validates :template_name, presence: true

  def deletable?
    unless self.projects.length == 0
      raise LazyDesign::ForbiddenError, "There are projects associated with this template"
    end
    true
  end
end

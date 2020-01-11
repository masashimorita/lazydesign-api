require 'active_support'

module PermissionVerification
  extend ActiveSupport::Concern

  def has_permission?(target, operation)
    self.permissions.where(target: target, operation: operation).first.present? rescue false
  end
end

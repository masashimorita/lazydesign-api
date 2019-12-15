require_relative "ulid"

module GenerateUlid
  def self.included(base)
    base.class_eval do
      if base < ActiveRecord::Base
        before_create -> { self.id =  ::Ulid.generate }
      else
        raise "You can only use this module with class inherited from ActiveRecord::Base"
      end
    end
  end
end

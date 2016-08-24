module Concerns
  module InstanceMethods

    def save
      self.class.all << self
      self
    end
  end
end
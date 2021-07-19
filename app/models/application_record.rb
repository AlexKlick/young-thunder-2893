class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.average_stat(column)
    average(column)
  end
end

class Tag < ActiveRecord::Base
  attr_accessible :name, :value, :command_id

  validates :name, :presence => true

  belongs_to :command
end

class Attribute < ActiveRecord::Base
  attr_accessible :name, :value, :command_id

  belongs_to :command
end

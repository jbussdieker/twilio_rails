class Attribute < ActiveRecord::Base
  attr_accessible :name, :value

  belongs_to :command
end

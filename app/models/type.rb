class Type < ActiveRecord::Base
  attr_accessible :name

  has_many :type_nestings

  def to_s
    name
  end
end

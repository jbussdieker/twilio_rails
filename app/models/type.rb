class Type < ActiveRecord::Base
  attr_accessible :name

  has_many :commands

  validates :name, :presence => true

  def to_s
    name
  end
end

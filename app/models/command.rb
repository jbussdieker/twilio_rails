class Command < ActiveRecord::Base
  attr_accessible :parent_id, :script_id, :type_id, :value, :position

  belongs_to :script
  belongs_to :type
  has_many :attributes
  has_many :nestings, :through => :type, :source => :type_nestings

  acts_as_tree order: "position"

  include ActsAsTree
end

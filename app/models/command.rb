class Command < ActiveRecord::Base
  attr_accessible :parent_id, :script_id, :type_id, :value, :position

  belongs_to :script
  belongs_to :type
  acts_as_tree order: "position"

  include ActsAsTree
end

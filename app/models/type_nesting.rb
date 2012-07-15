class TypeNesting < ActiveRecord::Base
  attr_accessible :child_id, :type_id

  belongs_to :type
  belongs_to :child, :foreign_key => "child_id", :class_name => "Type"
end

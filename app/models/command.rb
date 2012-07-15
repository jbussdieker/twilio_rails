class Command < ActiveRecord::Base
  attr_accessible :parent_id, :script_id, :type_id, :value, :position

  belongs_to :script
  belongs_to :type

  has_many :tags

  acts_as_tree order: "position"
  acts_as_list :scope => :parent

  include ActsAsTree

  validates :type, :presence => true

  def allowed_types
    if parent
      if parent.type.name == "Gather"
        Type.where("name = ? or name = ? or name = ?", "Say", "Play", "Pause").collect {|p| [ p.name, p.id ] }
      elsif parent.type.name == "Dial"
        Type.where("name = ? or name = ? or name = ?", "Number", "Client", "Conference").collect {|p| [ p.name, p.id ] }
      end
    else
      Type.where("name != ? and name != ? and name != ?", "Number", "Client", "Conference").collect {|p| [ p.name, p.id ] }
    end
  end
end

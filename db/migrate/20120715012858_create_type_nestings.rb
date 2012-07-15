class CreateTypeNestings < ActiveRecord::Migration
  def change
    create_table :type_nestings do |t|
      t.integer :type_id
      t.integer :child_id

      t.timestamps
    end
  end
end

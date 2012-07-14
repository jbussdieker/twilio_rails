class CreateCommands < ActiveRecord::Migration
  def change
    create_table :commands do |t|
      t.integer :script_id
      t.integer :parent_id
      t.integer :type_id
      t.integer :position
      t.string :value

      t.timestamps
    end
  end
end

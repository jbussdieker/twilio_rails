class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.string :value
      t.integer :command_id

      t.timestamps
    end
  end
end

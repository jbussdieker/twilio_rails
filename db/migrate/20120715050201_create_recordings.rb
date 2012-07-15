class CreateRecordings < ActiveRecord::Migration
  def change
    create_table :recordings do |t|
      t.string :RecordingSid
      t.string :RecordingUrl
      t.string :RecordingDuration
      t.string :CallSid

      t.boolean :new, :default => true

      t.timestamps
    end
  end
end

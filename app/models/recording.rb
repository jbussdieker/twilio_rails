class Recording < ActiveRecord::Base
  attr_accessible :CallSid, :RecordingDuration, :RecordingSid, :RecordingUrl

  def call
    Call.where("CallSid = ?", self.CallSid).first
  end
end

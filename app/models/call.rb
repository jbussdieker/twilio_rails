class Call < ActiveRecord::Base
  attr_accessible :CallSid, :AccountSid, :Caller, :Called, :CallStatus, :CallDuration

  def recordings
    Recording.where("CallSid = ?", self.CallSid)
  end
end

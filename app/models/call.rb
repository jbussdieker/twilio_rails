class Call < ActiveRecord::Base
  attr_accessible :CallSid, :AccountSid, :Caller, :Called, :CallStatus, :CallDuration
end

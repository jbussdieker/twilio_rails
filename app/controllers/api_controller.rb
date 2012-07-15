class ApiScope
  def initialize(script, call, recording, digits)
    @script=script
    @call=call
    @recording=recording
    @digits=digits
  end

  def get_binding
    return binding()
  end
end

class ApiController < ApplicationController
  def index
    if params["CallSid"]
      filter_params = params.reject {|key,value|
        !key.in?(["AccountSid", "CallSid", "Caller", "Called", "CallStatus", "CallDuration"])
      }

      @call = Call.where("CallSid" => params["CallSid"]).first

      if @call
        # update call status
        @call.update_attributes(filter_params)
      else
        # create new call log
        @call = Call.create(filter_params)
      end
    end

    if params["RecordingSid"]
      filter_params = params.reject {|key,value|
        !key.in?(["RecordingSid", "CallSid", "RecordingDuration", "RecordingUrl"])
      }
      @recording = Recording.create(filter_params)
    end

    # TODO: Choose based on call rules
    @script = Script.first

    @api_scope = ApiScope.new(@script, @call, @recording, params[:Digits])
    render :template => "scripts/show", :formats => :xml, :handlers => :builder
  end
end

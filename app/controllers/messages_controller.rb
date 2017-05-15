class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  #skip_before_filter :authenticate_user!, :only => "reply"
  include EchelonHandler

  def reply
    message_body = params["Body"]
    from_number = params["From"]
    message = EchelonHandler::search(message_body)
    boot_twilio
    sms = @client.messages.create(
     from: '+16579004302',
     to: from_number,
     body: message
    )

  end

  private

  def boot_twilio
    account_sid = ENV["TW_ID"]
    auth_token = ENV["TW_AUTH"]
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end

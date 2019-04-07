class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  

  def index
    
    
    @hooks = Webhook.all
    @day_of_week = event_days
    
    # @hook_payload = @hooks['time']


  end

  def receive
    data = JSON.parse(request.body.read)
    event = data['payload']['event']
    event_name = data['payload']['event_type']['name']
    start_time = event['start_time_pretty']
    end_time = event['end_time_pretty']

    canceled = event['canceled']
    canceler = event['canceler_name']
    cancel_reason = event['cancel_reason']
    canceled_at = event['canceled_at']

    invitee = data['payload']['invitee']
    invitee_name = invitee['name']
    invitee_email = invitee['email']

    Webhook.create(
      data: data.as_json, 
      canceled: canceled,
      event_name: event_name,
      start_time: start_time,
      end_time: end_time,
      canceler: canceler,
      cancel_reason: cancel_reason,
      canceled_at: canceled_at,
      invitee_name: invitee_name,
      invitee_email: invitee_email)

  end

  private

  def event_days
    day_of_week = Webhook.all.group_by_day(:created_at).count

    # canceled = Webhook.where()

    

    [
      { name: "Scheduled", data: day_of_week },
      { name: "Canceled", data: day_of_week }
      
    ]
    
  end

end

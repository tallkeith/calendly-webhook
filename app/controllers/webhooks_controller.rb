class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :load_webhooks

  # Provide instance variable for use in Chartkick
  def index
    @day_of_week = event_days
  end

  # Send a POST to this endpoint to capture data from a webhook
  def receive
  # I chose to store the whole webhook response, as well as breaking out
  # certain pieces of it into columns on the Webhooks model. IMO, it makes
  # things a bit more easy to read and work with.

  # Storing the whole webhook might not be the best solution here, but in
  # the future, if something from the original webhook was needed, we have
  # record of it and can find/work with it.
    data = JSON.parse(request.body.read)
    event = data['payload']['event']
    event_name = data['payload']['event_type']['name']
    start_time = event['start_time']
    end_time = event['end_time']

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

  def load_webhooks
    @hooks = Webhook.all.order('start_time desc')
  end

  def event_days
    scheduled = @hooks.where(canceled: false).group_by_day(:start_time).count
    canceled = @hooks.where(canceled: true).group_by_day(:start_time).count
    [
      { name: "Scheduled", data: scheduled },
      { name: "Canceled", data: canceled }
    ]
  end
end

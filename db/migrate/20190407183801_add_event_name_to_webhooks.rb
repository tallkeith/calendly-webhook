class AddEventNameToWebhooks < ActiveRecord::Migration[5.1]
  def change
    add_column :webhooks, :event_name, :string
  end
end

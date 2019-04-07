class AddStartTimeToWebhooks < ActiveRecord::Migration[5.1]
  def change
    add_column :webhooks, :start_time, :string
  end
end

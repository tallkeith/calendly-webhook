class AddEndTimeToWebhooks < ActiveRecord::Migration[5.1]
  def change
    add_column :webhooks, :end_time, :string
  end
end

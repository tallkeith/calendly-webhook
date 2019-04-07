class AddStartAndEndTimeToWebhooks < ActiveRecord::Migration[5.1]
  def change
    add_column :webhooks, :start_time, :datetime
    add_column :webhooks, :end_time, :datetime
  end
end

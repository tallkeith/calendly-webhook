class AddCancelReasonToWebhooks < ActiveRecord::Migration[5.1]
  def change
    add_column :webhooks, :cancel_reason, :string
  end
end

class AddCanceledToWebhooks < ActiveRecord::Migration[5.1]
  def change
    add_column :webhooks, :canceled, :boolean
  end
end

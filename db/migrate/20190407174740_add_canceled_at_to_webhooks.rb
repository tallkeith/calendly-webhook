class AddCanceledAtToWebhooks < ActiveRecord::Migration[5.1]
  def change
    add_column :webhooks, :canceled_at, :string
  end
end

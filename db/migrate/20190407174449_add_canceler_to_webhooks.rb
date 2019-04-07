class AddCancelerToWebhooks < ActiveRecord::Migration[5.1]
  def change
    add_column :webhooks, :canceler, :string
  end
end

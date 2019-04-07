class AddInviteeNameToWebhooks < ActiveRecord::Migration[5.1]
  def change
    add_column :webhooks, :invitee_name, :string
  end
end

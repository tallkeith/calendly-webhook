class AddInviteeEmailToWebhooks < ActiveRecord::Migration[5.1]
  def change
    add_column :webhooks, :invitee_email, :string
  end
end

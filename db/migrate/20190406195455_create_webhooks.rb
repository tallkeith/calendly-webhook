class CreateWebhooks < ActiveRecord::Migration[5.1]
  def change
    create_table :webhooks do |t|
      t.string :data
      t.string :integration

      t.timestamps
    end
  end
end

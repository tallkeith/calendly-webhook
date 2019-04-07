class Webhook < ApplicationRecord
  serialize :data, JSON

  validates   :invitee_name, presence: true
  validates   :invitee_email, format: { with: /@+/, message: 'must be a valid email address' }, allow_blank: true
end

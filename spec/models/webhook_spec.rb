require 'rails_helper'

RSpec.describe Webhook, type: :model do

  describe Webhook do
    let(:good_name)     { 'Foop McTester'}
    let(:good_email)    { 'foop@mctester.com' }
    let(:invalid_email) { 'not_a_valid_email' }

    let(:good_hook)       { Webhook.create(invitee_name: good_name, invitee_email: good_email) }
    let(:bad_name_hook)   { Webhook.create(invitee_name: '', invitee_email: invalid_email) }
    let(:bad_email_hook)  { Webhook.create(invitee_name: good_name, invitee_email: invalid_email) }

    describe 'Webhook' do
      context 'with good data' do
        it 'is created' do
          expect { good_hook }.to change { Webhook.count }.by(1)
        end
      end

      context 'with bad data' do
        it 'errors with bad name' do
          expect { bad_name_hook }.to_not change { Webhook.count }
          expect(bad_name_hook.errors[:invitee_name]).to include("can't be blank")
        end
        it 'errors with bad email' do
          expect { bad_email_hook }.to_not change { Webhook.count }
          expect(bad_email_hook.errors[:invitee_email]).to include('must be a valid email address')
        end
      end
    end
  end
end

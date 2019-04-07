class Webhook < ApplicationRecord
  serialize :data, JSON

  def canceled?
    
  end


end

class Address < ApplicationRecord
  
  def full_name
    self.postal_code + self.address + self.last_name + self.first_name
  end
  
end
class Address < ApplicationRecord
  
  def full_name
    self.postal_code + self.address + self.name
  end
  
end
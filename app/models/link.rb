class Link < ActiveRecord::Base

#validates :url, presence: true

#possible validations -

def self.gen_random_str

  SecureRandom.urlsafe_base64(4, false)
 
  #insert secure string in column
  #relate string to ID & backwards
end


def self.increment!

	update_attribute(:counter, counter + 1)

end





end

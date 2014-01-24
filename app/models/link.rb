class Link < ActiveRecord::Base

# self.primary_key = "rand_str"
  # this will help me with routing later

#alidates :url, presence: true



#possible validations -



def self.gen_random_str

  str = SecureRandom.hex(3).to_s

  
  #insert secure string in column



  #relate string to ID & backwards

  self.save
end


def self.update_counter

end


end

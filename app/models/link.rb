class Link < ActiveRecord::Base

#validates :url, presence: true

#possible validations -

def self.gen_random_str

  SecureRandom.urlsafe_base64(4, false)
 
  #insert secure string in column
  #relate string to ID & backwards
end


def self.update_counter
  
  Link.insert

end


def self.clean_up_url
   
    new_url = search_str.values.slice(0).prepend("http://")

end




end

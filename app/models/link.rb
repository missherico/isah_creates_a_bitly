class Link < ActiveRecord::Base

#validates :url, presence: true

#possible validations -

def self.gen_random_str

  SecureRandom.urlsafe_base64(4, false)
 
  #insert secure string in column
  #relate string to ID & backwards
end

def self.time_stamp
  select(:created_at, :updated_at).each do |time_stamp|
    if time_stamp.created_at > Time.now.beginning_of_day
     "#{time_ago_in_words(time_stamp.created_at)} ago"
    else  time_stamp.created_at.strftime("%b %d, %Y")
    end
  end
end

def self.update_counter
  
  Link.insert

end


def self.clean_up_url
   
    new_url = search_str.values.slice(0).prepend("http://")

end




end

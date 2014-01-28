# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  rand_str   :string(255)
#  counter    :integer          default(0)
#  created_at :datetime
#  updated_at :datetime
#  time_log   :string(255)
#

class Link < ActiveRecord::Base

#validates :url, presence: true

#possible validations -

def self.gen_random_str

  SecureRandom.urlsafe_base64(4, false)
 
  #insert secure string in column
  #relate string to ID & backwards
end

def up_counter  #no self is an instance method
    self.update_attributes(counter: counter + 1)
    return self
end


def self.check_if_url_created
  # is the retrieved search string already in the column?

end




end

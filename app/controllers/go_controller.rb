class GoController < ApplicationController


  def index

  	@links = Link.all
  	id = params[:rand_str]
    @link = Link.find_by_rand_str(id)

  end

  def new
    @link = Link.new
  end

  def create
    search_str = params.require(:link).permit(:url)

    # new hash to create, random string
    new_str_hash = {"rand_str" => Link.gen_random_str}
    updated_params = search_str.merge(new_str_hash)

    new_link = Link.create(updated_params)

    redirect_to go_preview_path(new_link.rand_str)
  end

  def preview
  	id = params[:rand_str]
    @link = Link.find_by_rand_str(id)

  end 

   def redirect
    #at every redirect, add +1 to the counter table
    id = params[:rand_str]
    link = Link.find_by_rand_str(id)
    link.time_log = []
    new_click_time = [Time.now]    
    link.time_log.insert(0, new_click_time)    
binding.pry

    ping = 1

    if link.counter = 0
    	link.counter = 1
    else
    link.counter += 1
    end
    binding.pry
     
   end



  def delete

  end


end
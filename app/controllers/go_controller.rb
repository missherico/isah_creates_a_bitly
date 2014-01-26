class GoController < ApplicationController


  def index

  	@links = Link.all.order('updated_at DESC')
  	id = params[:rand_str]
    @link = Link.find_by_rand_str(id)

    if @link.time_log == nil
      @link.time_log = []
      now = [Time.now]
      @link.time_log.insert(0, now)
    else
      now = [Time.now]
      @link.time_log.insert(0, now)
    end
    binding.pry
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
    @link.update_attribute("counter", @link.counter + 1)
    if @link.time_log == nil
      @link.time_log = []
    end
    now = [Time.now]
    @link.time_log.insert(0, now)
binding.pry

  

  end 

   def redirect
    id = params[:rand_str]
    link = Link.find_by_rand_str(id)
    link.update_attribute("counter", link.counter + 1)
    link.update_attribute("time_log", (link.time_log << [Time.now]).first)

binding.pry
    # if link.time_log == nil
    #   link.time_log = []
    #   a = link.time_log
    #   first = [link.created_at]
    #   a.insert(0, first)      
      
    # else
    #   a = link.time_log
    #   now = [Time.now]
    #   a.insert(0, now)
    # end 

    redirect_to link.url

    
   end


  def destroy
    id = params[:rand_str]
    link = Link.find_by_rand_str(id)
    link.destroy
    flash[:notice] = "Successfully deleted link."

    redirect_to go_index_path
  end

  def destroy_multiple
    params[:delete].each do |id|
      Link.find(id.to_i).destroy
    end

  end



end
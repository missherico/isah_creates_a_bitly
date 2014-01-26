class GoController < ApplicationController


  def index

  	@links = Link.all.order('updated_at DESC')
  	id = params[:rand_str]
    @link = Link.find_by_rand_str(id)

    # params[:delete].each do |id|
    #   Link.find(id.to_i).destroy
    # end
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
    id = params[:rand_str]
    link = Link.find_by_rand_str(id)
    link.time_log = []

    if link.time_log == nil
      link.time_log = []
      initial_time = [link.created_at]
      link.time_log.insert(0, initial_time)      
    else
      new_click_time = [Time.now]
      link.time_log.insert(0, new_click_time)
    end    

    if link.counter == nil
      link.counter = 1
    else
      link.counter += 1
    end


    
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
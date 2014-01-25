class GoController < ApplicationController


  def index
  	@links = Link.all
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
binding.pry
  	#create counter here - at click.
    render :preview
  end 

   def redirect

    
   end



  def delete

  end


end
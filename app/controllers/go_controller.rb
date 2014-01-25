class GoController < ApplicationController


  def index
  	@links = Link.all
  end

  def new
    @link = Link.new
  end

  def show
  	@link = Link.find(params[:rand_str])
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
    @link = Link.find(id)
  	#create counter here - at click.


  end 

  def edit
  end

  def update
  end



end
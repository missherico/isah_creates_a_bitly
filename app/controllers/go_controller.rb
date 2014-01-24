class GoController < ApplicationController


  def index
  	@links = Link.all
  end

  def new
    @link = Link.new
  end

  def show
  	id = params[:id]
  	@link = Link.find(id)
  end

  def create
    search_str = params.require(:link).permit(:url)
    #check if new link already exists
    new_str = SecureRandom.hex(3).to_s
    new_str_hash = {"rand_str" => new_str}

    updated_params = search_str.merge(new_str_hash)

binding.pry    
    new_link = Link.create(updated_params)

    redirect_to go_show_path(new_link.id)

  end

  def preview
  end 

  def edit
  end

  def update
  end



end
class CatagoriesController < ApplicationController

  before_action :require_admin, except: [:show, :index]

  def index
    @catagories = Catagory.paginate(page: params[:page], per_page: 3)
  end


  def new
    @catagory = Catagory.new
  end

  def create
    @catagory = Catagory.new(catagory_params)

    if @catagory.save
      flash[:success] = "catagory successfully created..."
      redirect_to catagories_path
    else
      render 'new'
    end
  end

  def edit
    @catagory = Catagory.find(params[:id])
  end

  def update
    @catagory = Catagory.find(params[:id])
    if @catagory.update(catagory_params)
      flash[:success] = "category successfully edited..."
      redirect_to catagory_path(@catagory)
    else
      render 'edit'
    end
  end

  def show
    @catagory = Catagory.find(params[:id])
    @catagory_articles = @catagory.articles.paginate(page: params[:page], per_page: 5)
  end

private
  def catagory_params
    params.require(:catagory).permit(:name)
  end

  def require_admin
    if !logged_in? || (logged_in? and !current_user.admin)
      flash[:danger] = "noly admin can perform that action"
      redirect_to catagories_path
    end
  end

end #class end

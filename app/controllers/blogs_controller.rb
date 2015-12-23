class BlogsController < ApplicationController
  
  def create
  	@blog = Blog.create(blog_params)
  	if @blog.save
  		flash[:success] = "Blog Created"
  		redirect_to @blog
  	else
  		render 'home/about'
  	end
  end

  def new
  	@blog = Blog.new
  end

  def index
  	@blogs = Blog.paginate(page: params[:page])
  end

  def show
  	@blog = Blog.find(params[:id])
  end

  def update
  end

  def edit
  end

  private

	  def blog_params
	  	params.require(:blog).permit(:title, :lead, :content, :article_url, :image_url, :category)
	  end

end

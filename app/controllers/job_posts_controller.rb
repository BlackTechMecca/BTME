class JobPostsController < ApplicationController
  before_action :set_job_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @job_posts = JobPost.all
  end

  def show
  end

  def new
    @job_post = JobPost.new
  end

  def edit
  end

  def create
    @job_post = current_user.job_posts.build(job_post_params)

    respond_to do |format|
      if @job_post.save
        format.html { redirect_to @job_post, notice: 'Job post was successfully created.' }
        format.json { render :show, status: :created, location: @job_post }
      else
        format.html { render :new }
        format.json { render json: @job_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @job_post.update(job_post_params)
        format.html { redirect_to @job_post, notice: 'Job post was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_post }
      else
        format.html { render :edit }
        format.json { render json: @job_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @job_post.destroy
    respond_to do |format|
      format.html { redirect_to job_posts_url, notice: 'Job post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_job_post
      @job_post = JobPost.find(params[:id])
    end

    def job_post_params
      params.require(:job_post).permit(:title, :description, :date)
    end
end

class FullProfilesController < ApplicationController
  before_action :set_full_profile, only: [:show, :edit, :update, :destroy]

  # GET /full_profiles
  # GET /full_profiles.json
  def index
    @full_profiles = FullProfile.all
  end

  # GET /full_profiles/1
  # GET /full_profiles/1.json
  def show
  end

  # GET /full_profiles/new
  def new
    @full_profile = FullProfile.new
  end

  # GET /full_profiles/1/edit
  def edit
  end

  # POST /full_profiles
  # POST /full_profiles.json
  def create
    @full_profile = FullProfile.new(full_profile_params)

    respond_to do |format|
      if @full_profile.save
        format.html { redirect_to @full_profile, notice: 'Full profile was successfully created.' }
        format.json { render :show, status: :created, location: @full_profile }
      else
        format.html { render :new }
        format.json { render json: @full_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /full_profiles/1
  # PATCH/PUT /full_profiles/1.json
  def update
    respond_to do |format|
      if @full_profile.update(full_profile_params)
        format.html { redirect_to @full_profile, notice: 'Full profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @full_profile }
      else
        format.html { render :edit }
        format.json { render json: @full_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /full_profiles/1
  # DELETE /full_profiles/1.json
  def destroy
    @full_profile.destroy
    respond_to do |format|
      format.html { redirect_to full_profiles_url, notice: 'Full profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_full_profile
      @full_profile = FullProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def full_profile_params
      params[:full_profile]
    end
end

class ActivitiesController < ApplicationController

  def index
    @recent_activities = Activity.recent_activity(10)
  end

end

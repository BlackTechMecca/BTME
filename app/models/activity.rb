class Activity < ActiveRecord::Base
  belongs_to :postable, :polymorphic => true

  def preview
    self.postable.preview
  end

  def self.recent_activity(limit)
    Activity.last(limit)
  end
end

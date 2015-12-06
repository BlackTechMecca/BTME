class Activity < ActiveRecord::Base
  belongs_to :postable, :polymorphic => true

  def preview
    self.postable.preview
  end

  def path_to_postable
    "/#{self.postable.class.table_name}/#{self.postable_id}"
  end

  def self.recent_activity(limit)
    Activity.last(limit)
  end
end

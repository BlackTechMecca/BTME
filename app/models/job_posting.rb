class JobPosting < ActiveRecord::Base
  belongs_to :user
  has_one :activity, 
          :as => :postable,
          :foreign_key => :postable_id

  validates :user_id, :title, :description, :presence => true

  after_save :_create_activity

  def _create_activity
    Activity.create(
      :postable_id => self.id,
      :postable_type => "JobPosting"
    )
  end
end

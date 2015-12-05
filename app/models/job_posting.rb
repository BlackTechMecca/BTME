class JobPosting < ActiveRecord::Base
  include Postable

  belongs_to :user
  has_one :activity, 
          :as => :postable,
          :foreign_key => :postable_id

  validates :user_id, :title, :description, :presence => true

  after_save :_create_activity
end

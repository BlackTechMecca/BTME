class Event < ActiveRecord::Base
  include Postable

  belongs_to :user

  has_one :activity, 
    :as => :postable,
    :foreign_key => :postable_id

  validates :name, :description, :date, :presence => true

  after_save :_create_activity

  def poster_name
    user.full_name
  end

  def preview
    "#{name} - #{description[0..15]}... (posted by #{user.first_name})"
  end
end

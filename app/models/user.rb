class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  after_save :_update_full_profile_timestamp
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :job_posts
  has_one :full_profile
  accepts_nested_attributes_for :full_profile, :update_only => true, :reject_if => :all_blank
  belongs_to :user

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def _update_full_profile_timestamp
    new_full_profile = full_profile || build_full_profile
    new_full_profile.update_attribute(:last_modified_timestamp, Time.now)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name # assuming the user model has a first name
      user.last_name = auth.info.last_name # assuming the user model has a last name
      user.image_url = auth.info.image # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.linkedin_data"] && session["devise.linkedin_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end

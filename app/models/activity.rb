class Activity < ActiveRecord::Base
  belongs_to :postable, :polymorphic => true

end

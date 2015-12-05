module Postable
  def _create_activity
    Activity.create(
      :postable_id => self.id,
      :postable_type => self.class,
    )
  end

  def preview
    raise NotImplementedError
  end
end

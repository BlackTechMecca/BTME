json.array!(@full_profiles) do |full_profile|
  json.extract! full_profile, :id
  json.url full_profile_url(full_profile, format: :json)
end

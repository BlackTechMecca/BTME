json.array!(@job_posts) do |job_post|
  json.extract! job_post, :id, :title, :description, :date
  json.url job_post_url(job_post, format: :json)
end

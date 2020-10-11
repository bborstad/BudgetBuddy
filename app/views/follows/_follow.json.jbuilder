json.extract! follow, :id, :requestor, :following, :created_at, :updated_at
json.url follow_url(follow, format: :json)

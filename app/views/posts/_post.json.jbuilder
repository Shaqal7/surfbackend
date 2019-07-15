json.extract! post, :id, :description, :created_at, :updated_at, :user_id, :picture, :latitude, :longitude, :city
json.forecast post.current_forecast
json.liked post.liked(current_user.id)
json.date post.creation_date
json.url post_url(post, format: :json)

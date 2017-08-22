json.extract! article, :id, :name, :source, :author, :topics, :photos, :friends, :created_at, :updated_at
json.url article_url(article, format: :json)

json.(@article, :id, :title, :body, :created_at, :updated_at)

json.comments @article.comments, :id, :article_id, :commenter, :body, :created_at, :updated_at

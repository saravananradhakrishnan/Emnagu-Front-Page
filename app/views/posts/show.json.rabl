object @post
attributes :id, :title, :body, :published_at, :created_at

child :user => :user do
  attributes :id, :email, :username, :gender
end

child :comments => :comments do
  attributes :id, :body, :user
end
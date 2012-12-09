class BlogPost
  include DataMapper::Resource

  property :id,         Serial
  property :title,      String, :required => true, :length => 80
  property :created_at, DateTime
  property :body,       Text
end

# DataMapper.auto_migrate!


# Two small test cases

post = BlogPost.new
post.title = "Foo bar"
post.body = "I am a blog post thing. Foo bar doo dar."
post.save
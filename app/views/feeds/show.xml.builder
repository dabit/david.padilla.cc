atom_feed do |feed|
  feed.title 'David Padilla: Engineer, Manager, Rubyist, Speaker'
  feed.updated @posts.published_and_ordered.where(cms: false).first.updated_at
  #feed.logo ""
  #feed.icon ""

  @posts.each do |post|
    feed.entry(post, url: miniblog.post_url(post)) do |entry|
      entry.title post.title
      entry.content post.html_body, type: 'html'
      entry.author do |author|
        author.name "David Padilla"
        author.email "david@padilla.cc"
      end
    end
  end
end

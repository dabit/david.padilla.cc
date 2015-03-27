xml.instruct!
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  xml.url do
    xml.loc archive_url
    xml.lastmod @posts.last.updated_at.strftime("%Y-%m-%dT%H:%M%:z")
  end

  xml.url do
    xml.loc about_me_url
    xml.lastmod @about.last.updated_at.strftime("%Y-%m-%dT%H:%M%:z")
  end

  @posts.each do |post|
    xml.url do
      xml.loc post_url(id: post.to_param)
      xml.lastmod post.updated_at.strftime("%Y-%m-%dT%H:%M%:z")
    end
  end
end

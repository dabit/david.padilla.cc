xml.instruct!
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  xml.url do
    xml.loc main_app.archive_url
    xml.lastmod @posts.last.updated_at.to_s(:miniblog_sitemap)
  end

  xml.url do
    xml.loc main_app.about_me_url
    xml.lastmod @about.last.updated_at.to_s(:miniblog_sitemap)
  end

  @posts.where(cms: false).each do |post|
    xml.url do
      xml.loc post_url(id: post.to_param)
      xml.lastmod post.updated_at.to_s(:miniblog_sitemap)
    end
  end
end

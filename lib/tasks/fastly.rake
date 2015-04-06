namespace :fastly do
  desc "Flush all Post cache from fastly"
  task flush: :environment do
    Miniblog::Post.purge_all
  end
end

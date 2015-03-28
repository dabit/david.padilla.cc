FastlyRails.configure do |c|
  c.api_key = ENV['FASTLY_API_KEY']  # Fastly api key, required
  c.max_age = 86400                  # time in seconds, optional, defaults to 2592000 (30 days)
  c.service_id = ENV['SERVICE_ID']   # The Fastly service you will be using, required
end

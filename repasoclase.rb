require "uri"
require "net/http"

url = URI("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=10&api_key=eEn9DjQUdeT9RQZez6td0qaNSjaOSgDtPDLys1Wj")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Get.new(url)

response = https.request(request)
puts response.read_body
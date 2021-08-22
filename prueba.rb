require "uri"
require "net/http"
require "json"

url = URI("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=10&api_key=eEn9DjQUdeT9RQZez6td0qaNSjaOSgDtPDLys1Wj")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Get.new(url)

response = https.request(request)

datos = JSON.parse response.read_body
puts datos.class


def build_web_page(datos)

    require "uri"
require "net/http"

url = URI("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=10&api_key=eEn9DjQUdeT9RQZez6td0qaNSjaOSgDtPDLys1Wj")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Get.new(url)

response = https.request(request)
puts response.read_body.class

    archivo_salida = File.open("prueba.html", "w")
    archivo_salida.puts "<html>
    <head>
        <title>Prueba1</title>
    </head>
<body>
    <ul>"
   datos.each do |foto|
     puts foto['img_src']
     archivo_salida.puts "<li><img src =#{foto['img_src']}>"
    end
archivo_salida.puts "</ul>
</body>
</html>"
    archivo_salida.close
end
build_web_page(datos)

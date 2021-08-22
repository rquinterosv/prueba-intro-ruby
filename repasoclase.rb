require "uri"
require "net/http"
require "json"
datos['photos'].each do |foto|
    foto['img_src']
url = URI("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=10&api_key=eEn9DjQUdeT9RQZez6td0qaNSjaOSgDtPDLys1Wj")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Get.new(url)

response = https.request(request)

datos = JSON.parse response.read_body

def build_web_page(datos)

archivo_salida = File.open("prueba1.html", "w")
archivo_salida.puts "<html>
def build_web_page(datos)

        <head>
            <title>Prueba1</title>
        </head>
    <body>
        <ul>"


    archivo_salida.puts foto
    end


archivo_salida.puts "</ul>
</body>
</html>"
archivo_salida.close
end

build_web_page(datos)
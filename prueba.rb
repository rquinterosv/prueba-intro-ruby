require "uri"
require "net/http"
require "json"

url = URI("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1&api_key=eEn9DjQUdeT9RQZez6td0qaNSjaOSgDtPDLys1Wj")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Get.new(url)

response = https.request(request)
datos = JSON.parse(response.read_body)


def build_web_page(datos)
archivo_salida = File.open("prueba.html", "w")
archivo_salida.puts "<html>
        <head>
            <title>Prueba</title>
        </head>
    <body>
        <ul>"

        datos["photos"].each do |foto|
            archivo_salida.puts "<li><img src=""#{foto["img_src"]}""></li>"
        end        

archivo_salida.puts "</ul>
</body>
</html>"
archivo_salida.close
    end

def photos_count(datos)
    archivo_fotos = File.open("photos.html", "w")
    archivo_fotos.puts "Nombre Camara"

    camaras = datos["photos"]
    
    camaras.each do |cam|
        archivo_fotos.puts "#{cam["camera"]["full_name"]}"
    end
    archivo_fotos.close
end
build_web_page(datos)
photos_count(datos)
require "uri"
require "net/http"
require "json"

url = URI("https://api.nasa.gov/planetary/apod?api_key=h48Vr2hydyLaFVb3CQguyIOSDFxoRKrs27wlD4OT")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Get.new(url)

response = https.request(request)

datos = JSON.parse response.read_body
puts datos.class


url = URI("https://api.nasa.gov/planetary/apod?api_key=h48Vr2hydyLaFVb3CQguyIOSDFxoRKrs27wlD4OT")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Get.new(url)

response = https.request(request)

datos = JSON.parse response.read_body

archivo_salida = File.open("prueba.html", "w")
archivo_salida.puts "<html>
        <head>
            <title>Prueba</title>
        </head>
    <body>
        <ul>"
def build_web_page(datos)
    datos.each do |foto|
        url = URI("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=#{foto["photos"]["img_src"]}&api_key=eEn9DjQUdeT9RQZez6td0qaNSjaOSgDtPDLys1Wj")

        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true

        request = Net::HTTP::Get.new(url)

        response = https.request(request)
        img = JSON.parse(response.read_body)

        archivo_salida.puts "#{foto["photos"]["img_src"]}"
    end
end
archivo_salida.puts "</ul>
</body>
</html>"
archivo_salida.close
build_web_page(datos)

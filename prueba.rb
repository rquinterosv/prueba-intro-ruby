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
archivo_salida = File.open("prueba.html", "w")
def build_web_page(datos)
    archivo_salida.puts "<html>
        <head>
            <title>Prueba1</title>
        </head>
    <body>
        <ul>"



    datos['photos'].each do |foto|
    url = URI("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=#{foto}&api_key=eEn9DjQUdeT9RQZez6td0qaNSjaOSgDtPDLys1Wj")
    
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    
    request = Net::HTTP::Get.new(url)
    
    response = https.request(request)
    
    puts response.read_body
    datos1 = JSON.parse(response.read_body)

    
    end
    archivo_salida.puts "link: #{datos1['img_src']}"


archivo_salida.puts "</ul>
</body>
</html>"
archivo_salida.close
end


build_web_page(datos)
require 'nokogiri'
require 'open-uri'

html= Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))

#------------------permet de trouver toute les villes-----------

    def get_townhall_city(html)
            city =[]
            html.search("p/a").each do |element|
            city << element.text.downcase.tr(" ", "-")
    end
            return city
    end

#-----permet d'avoir tout les adresse html de chaque ville ----

    def get_townhall_urls(html)
            url = []
            get_townhall_city(html).each do |x|
            url << "http://annuaire-des-mairies.com/95/#{x}.html"
    end 
            return url
    end

#------------repertoire de mail et leur emplacement-------------
    
    def get_townhall_email(html)
            mail = []
            get_townhall_urls(html).map do |url|
            mail << Nokogiri::HTML(URI.open(url)).search("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
    end 
            return mail
    end

    #-----------------on assemble les 2 morray------------------

    def townhall_and_email(html)
        
        contact = get_townhall_city(html).zip(get_townhall_email(html)).map{ |x| [x].to_h}
        puts  contact

    end

    
    townhall_and_email(html)


    


         

    

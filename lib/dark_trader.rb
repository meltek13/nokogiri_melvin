require 'nokogiri'
require 'open-uri'

    def web
        html = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
    end

    def find_the_crypto_name(web)
        crypto = []

            web.search('td[2]/div/a').each do |element|
            crypto << element.text
            end
    
        return crypto   
    end

    def find_the_crypto_value(web)
        value = []

            web.search('.price___3rj7O').each do |element|
            value << element.text.tr("$", "")
            end

        return value
    end
 
    def crypto_name_with_crypto_value(crypto, value)

            total = crypto.zip(value).map{ |x| [x].to_h}

        puts total
    
    end
    
    
    crypto = find_the_crypto_name(web)
    value = find_the_crypto_value(web)
    crypto_name_with_crypto_value(crypto, value)
   






    











#page = Nokogiri::HTML(open("https://coinmarketcap.com/")).read
#puts page
#all_emails_links.each do |email_link|
#    puts email_link.text #ou n'importe quelle autre opération de ton choix ;)
#   end

#//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[2]/div/a
#//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[2]/td[2]/div/a
#//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[4]/div/a
#//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[2]/td[4]/div/a
require 'rubygems'
require 'nokogiri'
require 'open-uri'



def get_all_the_urls_of_val_doise_townhalls

	tableau_lien = Array.new
	url_only = ""
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

	url = page.css(".lientxt")


	url.each {|link| 

		url_only = link["href"]

		url_only_without_point = url_only[1, url_only.length]
		
		tableau_lien << url_only_without_point
		
	}
	
	tableau_lien
	
end

def get_the_email_of_a_townhal_from_its_webpage (tableau_lien)

	
	tableau_email = Array.new

	tableau_lien.each { |url|


	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com#{url}")) 


	e_mail_ville = page.css('td')[7]

	tableau_email << e_mail_ville.text

	}
	
	tableau_email

end

def hash_emails_villes(tableau_lien, tableau_email)

	i = 0
	hash_emails_villes = Hash.new

	tableau_lien.each { |ville|


		hash_emails_villes[ville] = tableau_email[i]
	

		i += 1


	}

	puts hash_emails_villes

end



tableau_lien = get_all_the_urls_of_val_doise_townhalls
tableau_email = get_the_email_of_a_townhal_from_its_webpage(tableau_lien)
hash_emails_villes(tableau_lien, tableau_email)


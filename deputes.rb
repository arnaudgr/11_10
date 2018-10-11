require 'rubygems'
require 'nokogiri'
require 'open-uri'

def email_deputies

	array_email = Array.new
	
	page = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&lang=fr"))

	mails_deputies = page.css(".no_puce").css("li").css("a").css(".ann_mail")

	mails_deputies.each { |emails|

		array_email << emails.text
	}
	
	return array_email
end

email_deputies

def first_name_deputies

	array_first_name = Array.new
	
	page = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&lang=fr"))

	name_deputies = page.css(".no_puce").css(".titre_normal")

	name_deputies.each { |name_deputies|
		
		first_name_deputies = name_deputies.text
		first_name_deputies = first_name_deputies.split[1]
		
		array_first_name << first_name_deputies	
	
	}
	
	return array_first_name
end

def last_name_deputies

	array_last_name = Array.new
	
	page = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&lang=fr"))

	name_deputies = page.css(".no_puce").css(".titre_normal")

	name_deputies.each { |name_deputies|
		
		last_name_deputies = name_deputies.text
		last_name_deputies = last_name_deputies.split[2]

		array_last_name << last_name_deputies
	
	}
	
	return array_last_name
end




puts email_deputies
puts last_name_deputies
puts first_name_deputies

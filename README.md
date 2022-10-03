# NikeScraper
A simple scraper to scrape Nike products from a provided url

Class has 3 methods:


- get_product_details  (Scrapes the provided url)
- prepare_report (Returns report for output)
- to_s (Returns report in String format)

### Used gems
Scraper program uses 'nokogiri' and 'HTTParty' gems

- The Nokogiri::HTML construct takes in the opened file’s info and wraps it in a special Nokogiri data object.
- HTTParty is a gem that makes HTTP fun! It is the gem our scraper will use to send an HTTP request to the page(s) we’re scraping.


require 'HTTParty'
require 'Nokogiri'

class NikeScraper

  attr_accessor :url, :parsed_page, :products

  def initialize(url)
    @url = url
    @parsed_page = ""
    @products = []
  end

  def get_product_details
    doc = HTTParty.get(url)
    parsed_page ||= Nokogiri::HTML(doc)

    product_cards = parsed_page.css('.product-grid__items').css('.product-card')

    product_cards.each do |product_card|
      title = product_card.css('.product-card__title').first.text
      price = product_card.css('.product-price').first.text

      product_info = { title: title, price: price }
      products << product_info
    end
  end

  def prepare_report
    output = "Total scraped items: #{products.size} \n"
    output << "#"*55
    output << "\n"

    products.map.with_index(1) do |product, idx| 
      output << "#{(idx.to_s + ')').ljust(3)} Title: #{product[:title].ljust(55)} price: #{product[:price]} \n"
    end

    output
  end

  def to_s
    if products.empty?
      "No products have been scraped. Use 'get_product_details' method first."
    else
      prepare_report
    end
  end
end

scraper = NikeScraper.new('https://www.nike.com/w/mens-nike-by-you-lifestyle-shoes-13jrmz6ealhznik1zy7ok')
scraper.get_product_details
puts scraper.to_s
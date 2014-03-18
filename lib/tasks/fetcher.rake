# Grabs the latest blood stock data for the Welsh Blood Service
# and creates a set of Record objects

require 'open-uri'
namespace :wales do
  desc "Fetches Welsh Blood Service Data"
  task fetch: :environment do
    doc = Nokogiri::HTML(open('http://www.welsh-blood.org.uk/about-blood/blood-stock-levels'))
    raw_data = doc.xpath('//*[@id="content"]/div[4]/script').to_s.gsub(/\s+/, "")
    results = []
    raw_data.scan(/(\[\d*\.?\d*,'[ABO]B?(pos|neg)','#\S{6}'\])/i).each do |result|
      results << eval(result[0])
    end

    results.each do |result|
      blood_type = result[1].match(/([ABO]?B?)(pos|neg)/)
      positive = blood_type[2].eql?('pos')
      blood_type_obj = BloodType.where(letter: blood_type[1], positive: positive).first
      blood_type_obj.records.create(days_remaining: result[0].to_f, authority: 'welshbloodservice')
    end
  end
end

namespace :snbtc do
  desc "Fetches Scottish Blood Service Data"
  task fetch: :environment do
    doc = Nokogiri::HTML(open('http://www.scotblood.co.uk/learn-about-blood/current-blood-stock-levels.aspx'))
    raw_data = doc.xpath('//*[@id="form1"]/ul/li')
    raw_data.each do |result|
      blood = result.attributes['title'].to_s.match(/([ABO]B?)([+-]) blood stocks are currently (\d{1,2}.\d) days./i)
      positive = blood[2].eql?('+')
      blood_type = BloodType.where(letter: blood[1], positive: positive).first
      blood_type.records.create(days_remaining: blood[3].to_f, authority: 'snbtc')
    end
  end
end
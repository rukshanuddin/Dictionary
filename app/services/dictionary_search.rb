require "uri"
require "net/http"
require "json"

class DictionarySearch
  OXFORD_EN_US_ENDPOINT_URL = "https://od-api.oxforddictionaries.com/api/v2/entries/en-us/"
  attr_accessor :endpoint, :query, :word

  def initialize(params)
    @endpoint = params[:endpoint].downcase
    @query = params[:q].chomp
  end

  def call
    case
    when @endpoint == "oxford"
      begin
        url = URI(OXFORD_EN_US_ENDPOINT_URL + "#{query}")
        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true

        request = Net::HTTP::Get.new(url)
        request["app_id"] = app_id
        request["app_key"] = app_key

        response = https.request(request)
        result = JSON.parse(response.read_body)

        @word = Word.create(name: result["id"]) do |word|
          word.definition = result["results"][0]["lexicalEntries"][0]["entries"][0]["senses"][0]["definitions"][0]
        end
      rescue URI::InvalidURIError => e
        # logger.error("Error: #{e.exception}")
        puts "\n\n"
        puts "ERROR: #{e.exception}\n"
        puts "The entry #{query} is not a valid search term, remove any spaces and try again"
        puts "\n\n"
        return false
      rescue Exception => e
        puts "ERROR: An error occured, #{response.code} HTTP code received."
        puts "#{response.error_type}. ERROR: #{e.exception}\n"
        puts "Error: #{response.header.read_body}"
        # logger.error("#{response.code} #{response.msg}")
        # logger.error(e)
        # logger.error(response.to_hash)
        puts "#{response.header.read_body}"
        return false
      end
    end
  end

  private

  def app_id
    ENV[@endpoint.upcase + "_APP_ID"]
  end

  def app_key
    ENV[@endpoint.upcase + "_APP_KEY"]
  end
end

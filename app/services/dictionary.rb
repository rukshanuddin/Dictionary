require "uri"
require "net/http"
require "json"

OXFORD_EN_US_ENDPOINT_URL = "https://od-api.oxforddictionaries.com/api/v2/entries/en-us/"

class Dictionary

  attr_accessor :endpoint, :q

  def initialize(params)
    @endpoint   = params[:endpoint]
    @query = params[:q].chomp
  end

  def call
  case @endpoint == "oxford"
    begin
      url = URI(OXFORD_EN_US_ENDPOINT_URL+"#{query}")
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
      redirect_to action: "show", id: @word.id
    rescue URI::InvalidURIError => e
      logger.error("Error: #{e.exception}")
      flash[:notice] = "#{query} is not a valid search term, remove any spaces and try again"
      redirect_to error_path
    rescue Exception => e
      puts "ERROR: An error occured, #{response.code} HTTP code received."
      puts "#{response.error_type}. ERROR: #{e.exception}\n"
      puts "Error: #{response.header.read_body}"
      logger.error("#{response.code} #{response.msg}")
      logger.error(e)
      logger.error(response.to_hash)
      flash[:notice] = "#{response.header.read_body}"
      redirect_to error_path
    end
end
    end

  private

      def app_id
        ENV[@endpoint.upcase + "_APP_ID"]
      end

      def api_key
        ENV[@endpoint.upcase + "_APP_KEY"]
      end

end

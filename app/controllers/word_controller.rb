require "uri"
require "net/http"
require "json"
EN_US_ENDPOINT_URL = "https://od-api.oxforddictionaries.com/api/v2/entries/en-us/"

class WordController < ApplicationController

  def index
    @words = Word.last(5)
  end

  def error
  end

  def new
    @word = Word.find_by(name: params[:q])
    if @word
      redirect_to action: "show", id: @word.id
    else
      query = params[:q]
      url = URI("https://od-api.oxforddictionaries.com/api/v2/entries/en-us/#{query}")
      begin
        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true

        request = Net::HTTP::Get.new(url)
        request["app_id"] = ENV[APP_ID]
        request["app_key"] = ENV[APP_KEY]

        response = https.request(request)
        result = JSON.parse(response.read_body)
        @word = Word.create(name: result["id"]) do |word|
          word.definition = result["results"][0]["lexicalEntries"][0]["entries"][0]["senses"][0]["definitions"][0]
        end
        redirect_to action: "show", id: @word.id
      rescue NoMethodError
        redirect_to error_path
      end
    end
  end

  def show
    @word = Word.find_by(id: params[:id])
  end

end

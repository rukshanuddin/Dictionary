require "uri"
require "net/http"
require "json"
EN_US_ENDPOINT_URL = "https://od-api.oxforddictionaries.com/api/v2/entries/en-us/"

class WordController < ApplicationController

  def index
    @words = Word.last(5)
  end

  def new
    @word = Word.find_by(name: params[:q])
    if @word
    else
        query = params[:q]
        url = URI("https://od-api.oxforddictionaries.com/api/v2/entries/en-us/#{query}")

        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true

        request = Net::HTTP::Get.new(url)
        request["app_id"] = "3feafaf9"
        request["app_key"] = "990e3c57ef35957955b9b156464f1522"

        response = https.request(request)
        result = JSON.parse(response.read_body)

        @word = Word.create(name: result["id"]) do |word|
            word.definition = result["results"][0]["lexicalEntries"][0]["entries"][0]["senses"][0]["definitions"][0]
        end
    end
    redirect_to action: "show", id: @word.id
  end

  def show
    @word = Word.find_by(id: params[:id])
  end

end

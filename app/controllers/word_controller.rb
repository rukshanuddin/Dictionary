class WordController < ApplicationController
  def index
    @words = Word.last(5)
  end

  def error; end

  def new
    @word = Word.find_by(name: params[:q])
    if @word
      redirect_to action: "show", id: @word.id
    else
      if DictionarySearch.new(word_params).call
        @word = DictionarySearch.new(word_params).call
        redirect_to action: "show", id: @word.id
      else
        redirect_to error_path
      end
    end
  end

  def show
    @word = Word.find_by(id: params[:id])
  end

  private

  def word_params
    params.permit(:endpoint, :q, :authenticity_token, :commit)
  end
end

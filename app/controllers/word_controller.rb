
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
      Dictionary.call(word_params)
    end
  end

  def show
    @word = Word.find_by(id: params[:id])
  end

private

  def word_params
    params.permit(:endpoint, :q)
  end

end

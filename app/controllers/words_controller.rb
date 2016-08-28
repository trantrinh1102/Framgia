class WordsController < ApplicationController
  def index
    @categories = Category.all
    @words = Word.of_category(params[:category_id])
      .result_filter(current_user.id, params[:check_learned])
      .paginate(page: params[:page], per_page: Settings.per_page)
  end
end

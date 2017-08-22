class ArticleStepsController < ApplicationController
  include Wicked::Wizard
   before_action :set_article, only: [:show, :update,:create]
   steps  :topics, :photos, :friends

   def show
    render_wizard
   end

   def update
     @article.update_attributes(article_params)
     if step == steps.last
       redirect_to @article
     else
       render_wizard @article
     end
   end

  private
      # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:article_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:name, :source, :author, :topics, :photos, :friends)
    end


    def redirect_to_finish_wizard(options = nil)
      redirect_to root_path , notice: "Thank you for signing up."
    end
end

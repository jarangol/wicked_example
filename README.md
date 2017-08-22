# README

Aplicación ejemplo de uso de la gema wicked para wizard forms.

Source: http://railscasts.com/episodes/346-wizard-forms-with-wicked

* Ruby version: 2.4.1

* Database creation: rake db:migrate

## Pasos:

* Instalar la gema:
  $ gem 'wicked'

* Generar steps controler:
  $ rails g controller "article_steps"

* Basarse en el ejemplo para el codigo de article_steps.rb

* Añadir esta linea al principio de "article_steps_controller.rb"
  include Wicked::Wizard

* Escribir los pasos de la siguiente forma:
  steps :personal, :social

* Crear una vista (.html.erb) por cada step dentro de la carpeta
  "app/views/article_steps/"

* Crear la vista "_form" en app/views/article_steps/

* Cambiar el contenido del metodo create en el controlador original,
  para que redireccione hacia el controladores de los pasos (article_steps_controller)

  def create
    @article = Article.new(article_params)
      if @article.save
        redirect_to article_steps_path(:article_id => @article.id)
      else
        render :new
      end
    end
  end

  Es importante pasarle como parametro el id del elemento.

* Anidar las rutas de steps_controller en las de articles_controller  

  scope "articles/:article_id" do
   resources :article_steps
  end

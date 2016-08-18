require 'utilities/estados'

class WelcomeController < ApplicationController

  def index
    @estados = []
    Estados.estados.first().each_slice(4) { | estado |
      @estados << estado
    }
    @michoacan = Product.limit(6).where(:origin => "michoacán")
    @jalisco = Product.limit(6).where(:origin => "jalisco")
    @providers = Provider.limit(8).all()
    category = Category.find_by name: "materias primas"
    @primas = Product.limit(6).where(:category => category.id)
  end

  def search
    @products = Product.search(params[:search]).records
    render :template => "/products/index"
  end

  def our
  end

end

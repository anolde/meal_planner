class CompositionsController < ApplicationController
  before_action :current_user_must_be_composition_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_composition_user
    composition = Composition.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == composition.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Composition.ransack(params[:q])
    @compositions = @q.result(:distinct => true).includes(:recipe, :ingredient, :user).page(params[:page]).per(10)

    render("composition_templates/index.html.erb")
  end

  def show
    @composition = Composition.find(params.fetch("id_to_display"))

    render("composition_templates/show.html.erb")
  end

  def new_form
    @composition = Composition.new

    render("composition_templates/new_form.html.erb")
  end

  def create_row
    @composition = Composition.new

    @composition.quantity = params.fetch("quantity")
    @composition.recipe_id = params.fetch("recipe_id")
    @composition.ingredient_id = params.fetch("ingredient_id")
    @composition.user_id = params.fetch("user_id")

    if @composition.valid?
      @composition.save

      redirect_back(:fallback_location => "/compositions", :notice => "Composition created successfully.")
    else
      render("composition_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_recipe
    @composition = Composition.new

    @composition.quantity = params.fetch("quantity")
    @composition.recipe_id = params.fetch("recipe_id")
    @composition.ingredient_id = params.fetch("ingredient_id")
    @composition.user_id = params.fetch("user_id")

    if @composition.valid?
      @composition.save

      redirect_to("/recipes/#{@composition.recipe_id}", notice: "Composition created successfully.")
    else
      render("composition_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_ingredient
    @composition = Composition.new

    @composition.quantity = params.fetch("quantity")
    @composition.recipe_id = params.fetch("recipe_id")
    @composition.ingredient_id = params.fetch("ingredient_id")
    @composition.user_id = params.fetch("user_id")

    if @composition.valid?
      @composition.save

      redirect_to("/ingredients/#{@composition.ingredient_id}", notice: "Composition created successfully.")
    else
      render("composition_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @composition = Composition.find(params.fetch("prefill_with_id"))

    render("composition_templates/edit_form.html.erb")
  end

  def update_row
    @composition = Composition.find(params.fetch("id_to_modify"))

    @composition.quantity = params.fetch("quantity")
    @composition.recipe_id = params.fetch("recipe_id")
    @composition.ingredient_id = params.fetch("ingredient_id")
    

    if @composition.valid?
      @composition.save

      redirect_to("/compositions/#{@composition.id}", :notice => "Composition updated successfully.")
    else
      render("composition_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_recipe
    @composition = Composition.find(params.fetch("id_to_remove"))

    @composition.destroy

    redirect_to("/recipes/#{@composition.recipe_id}", notice: "Composition deleted successfully.")
  end

  def destroy_row_from_ingredient
    @composition = Composition.find(params.fetch("id_to_remove"))

    @composition.destroy

    redirect_to("/ingredients/#{@composition.ingredient_id}", notice: "Composition deleted successfully.")
  end

  def destroy_row_from_user
    @composition = Composition.find(params.fetch("id_to_remove"))

    @composition.destroy

    redirect_to("/users/#{@composition.user_id}", notice: "Composition deleted successfully.")
  end

  def destroy_row
    @composition = Composition.find(params.fetch("id_to_remove"))

    @composition.destroy

    redirect_to("/compositions", :notice => "Composition deleted successfully.")
  end
end

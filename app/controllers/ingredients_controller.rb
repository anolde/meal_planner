class IngredientsController < ApplicationController
  before_action :current_user_must_be_ingredient_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_ingredient_user
    ingredient = Ingredient.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == ingredient.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @ingredients = Ingredient.page(params[:page]).per(10)

    render("ingredient_templates/index.html.erb")
  end

  def show
    @composition = Composition.new
    @ingredient = Ingredient.find(params.fetch("id_to_display"))

    render("ingredient_templates/show.html.erb")
  end

  def new_form
    @ingredient = Ingredient.new

    render("ingredient_templates/new_form.html.erb")
  end

  def create_row
    @ingredient = Ingredient.new

    @ingredient.name = params.fetch("name")
    @ingredient.user_id = params.fetch("user_id")

    if @ingredient.valid?
      @ingredient.save

      redirect_back(:fallback_location => "/ingredients", :notice => "Ingredient created successfully.")
    else
      render("ingredient_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @ingredient = Ingredient.find(params.fetch("prefill_with_id"))

    render("ingredient_templates/edit_form.html.erb")
  end

  def update_row
    @ingredient = Ingredient.find(params.fetch("id_to_modify"))

    @ingredient.name = params.fetch("name")
    

    if @ingredient.valid?
      @ingredient.save

      redirect_to("/ingredients/#{@ingredient.id}", :notice => "Ingredient updated successfully.")
    else
      render("ingredient_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @ingredient = Ingredient.find(params.fetch("id_to_remove"))

    @ingredient.destroy

    redirect_to("/users/#{@ingredient.user_id}", notice: "Ingredient deleted successfully.")
  end

  def destroy_row
    @ingredient = Ingredient.find(params.fetch("id_to_remove"))

    @ingredient.destroy

    redirect_to("/ingredients", :notice => "Ingredient deleted successfully.")
  end
end

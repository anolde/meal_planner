class RestaurantsController < ApplicationController
  before_action :current_user_must_be_restaurant_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_restaurant_user
    restaurant = Restaurant.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == restaurant.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @restaurants = Restaurant.all

    render("restaurant_templates/index.html.erb")
  end

  def show
    @restaurant = Restaurant.find(params.fetch("id_to_display"))

    render("restaurant_templates/show.html.erb")
  end

  def new_form
    @restaurant = Restaurant.new

    render("restaurant_templates/new_form.html.erb")
  end

  def create_row
    @restaurant = Restaurant.new

    @restaurant.name = params.fetch("name")
    @restaurant.location = params.fetch("location")
    @restaurant.user_id = params.fetch("user_id")
    @restaurant.menu_link = params.fetch("menu_link")

    if @restaurant.valid?
      @restaurant.save

      redirect_back(:fallback_location => "/restaurants", :notice => "Restaurant created successfully.")
    else
      render("restaurant_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @restaurant = Restaurant.find(params.fetch("prefill_with_id"))

    render("restaurant_templates/edit_form.html.erb")
  end

  def update_row
    @restaurant = Restaurant.find(params.fetch("id_to_modify"))

    @restaurant.name = params.fetch("name")
    @restaurant.location = params.fetch("location")
    
    @restaurant.menu_link = params.fetch("menu_link")

    if @restaurant.valid?
      @restaurant.save

      redirect_to("/restaurants/#{@restaurant.id}", :notice => "Restaurant updated successfully.")
    else
      render("restaurant_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @restaurant = Restaurant.find(params.fetch("id_to_remove"))

    @restaurant.destroy

    redirect_to("/users/#{@restaurant.user_id}", notice: "Restaurant deleted successfully.")
  end

  def destroy_row
    @restaurant = Restaurant.find(params.fetch("id_to_remove"))

    @restaurant.destroy

    redirect_to("/restaurants", :notice => "Restaurant deleted successfully.")
  end
end

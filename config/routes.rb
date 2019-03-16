Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "restaurants#index"
  # Routes for the Contact resource:

  # CREATE
  get("/contacts/new", { :controller => "contacts", :action => "new_form" })
  post("/create_contact", { :controller => "contacts", :action => "create_row" })

  # READ
  get("/contacts", { :controller => "contacts", :action => "index" })
  get("/contacts/:id_to_display", { :controller => "contacts", :action => "show" })

  # UPDATE
  get("/contacts/:prefill_with_id/edit", { :controller => "contacts", :action => "edit_form" })
  post("/update_contact/:id_to_modify", { :controller => "contacts", :action => "update_row" })

  # DELETE
  get("/delete_contact/:id_to_remove", { :controller => "contacts", :action => "destroy_row" })

  #------------------------------

  # Routes for the Composition resource:

  # CREATE
  get("/compositions/new", { :controller => "compositions", :action => "new_form" })
  post("/create_composition", { :controller => "compositions", :action => "create_row" })

  # READ
  get("/compositions", { :controller => "compositions", :action => "index" })
  get("/compositions/:id_to_display", { :controller => "compositions", :action => "show" })

  # UPDATE
  get("/compositions/:prefill_with_id/edit", { :controller => "compositions", :action => "edit_form" })
  post("/update_composition/:id_to_modify", { :controller => "compositions", :action => "update_row" })

  # DELETE
  get("/delete_composition/:id_to_remove", { :controller => "compositions", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # Routes for the Ingredient resource:

  # CREATE
  get("/ingredients/new", { :controller => "ingredients", :action => "new_form" })
  post("/create_ingredient", { :controller => "ingredients", :action => "create_row" })

  # READ
  get("/ingredients", { :controller => "ingredients", :action => "index" })
  get("/ingredients/:id_to_display", { :controller => "ingredients", :action => "show" })

  # UPDATE
  get("/ingredients/:prefill_with_id/edit", { :controller => "ingredients", :action => "edit_form" })
  post("/update_ingredient/:id_to_modify", { :controller => "ingredients", :action => "update_row" })

  # DELETE
  get("/delete_ingredient/:id_to_remove", { :controller => "ingredients", :action => "destroy_row" })

  #------------------------------

  # Routes for the Recipe resource:

  # CREATE
  get("/recipes/new", { :controller => "recipes", :action => "new_form" })
  post("/create_recipe", { :controller => "recipes", :action => "create_row" })

  # READ
  get("/recipes", { :controller => "recipes", :action => "index" })
  get("/recipes/:id_to_display", { :controller => "recipes", :action => "show" })

  # UPDATE
  get("/recipes/:prefill_with_id/edit", { :controller => "recipes", :action => "edit_form" })
  post("/update_recipe/:id_to_modify", { :controller => "recipes", :action => "update_row" })

  # DELETE
  get("/delete_recipe/:id_to_remove", { :controller => "recipes", :action => "destroy_row" })

  #------------------------------

  # Routes for the Restaurant resource:

  # CREATE
  get("/restaurants/new", { :controller => "restaurants", :action => "new_form" })
  post("/create_restaurant", { :controller => "restaurants", :action => "create_row" })

  # READ
  get("/restaurants", { :controller => "restaurants", :action => "index" })
  get("/restaurants/:id_to_display", { :controller => "restaurants", :action => "show" })

  # UPDATE
  get("/restaurants/:prefill_with_id/edit", { :controller => "restaurants", :action => "edit_form" })
  post("/update_restaurant/:id_to_modify", { :controller => "restaurants", :action => "update_row" })

  # DELETE
  get("/delete_restaurant/:id_to_remove", { :controller => "restaurants", :action => "destroy_row" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

class ContactsController < ApplicationController
  before_action :current_user_must_be_contact_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_contact_user
    contact = Contact.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == contact.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @contacts = Contact.all

    render("contact_templates/index.html.erb")
  end

  def show
    @contact = Contact.find(params.fetch("id_to_display"))

    render("contact_templates/show.html.erb")
  end

  def new_form
    @contact = Contact.new

    render("contact_templates/new_form.html.erb")
  end

  def create_row
    @contact = Contact.new

    @contact.first_name = params.fetch("first_name")
    @contact.last_name = params.fetch("last_name")
    @contact.email = params.fetch("email")
    @contact.user_id = params.fetch("user_id")

    if @contact.valid?
      @contact.save

      redirect_back(:fallback_location => "/contacts", :notice => "Contact created successfully.")
    else
      render("contact_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @contact = Contact.find(params.fetch("prefill_with_id"))

    render("contact_templates/edit_form.html.erb")
  end

  def update_row
    @contact = Contact.find(params.fetch("id_to_modify"))

    @contact.first_name = params.fetch("first_name")
    @contact.last_name = params.fetch("last_name")
    @contact.email = params.fetch("email")
    

    if @contact.valid?
      @contact.save

      redirect_to("/contacts/#{@contact.id}", :notice => "Contact updated successfully.")
    else
      render("contact_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @contact = Contact.find(params.fetch("id_to_remove"))

    @contact.destroy

    redirect_to("/users/#{@contact.user_id}", notice: "Contact deleted successfully.")
  end

  def destroy_row
    @contact = Contact.find(params.fetch("id_to_remove"))

    @contact.destroy

    redirect_to("/contacts", :notice => "Contact deleted successfully.")
  end
end

class ContactsController < ApplicationController
  # Anytime this code runs, it creates a new blank 'contact obj' in the machine memory
  def new
    @contact = Contact.new # An instance of the Contact class in the model
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to new_contact_path, notice: 'Contact information saved!'
    else
      redirect_to new_contact_path, notice: 'An error occured, try again!'

    end
  end
  #   Whitelist info collected fromm the forms -- meaning ensure info is securely saved to Db

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :comments)
  end
end

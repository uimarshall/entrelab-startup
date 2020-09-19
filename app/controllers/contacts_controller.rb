class ContactsController < ApplicationController
  # Anytime this code runs, it creates a new blank 'contact obj' in the machine memory
  def new
    @contact = Contact.new # An instance of the Contact class in the model
  end

  # POST request to /contacts
  def create
    # Mass assignment of form fields into @contact object
    @contact = Contact.new(contact_params)
    # Save the Contact object to db
    if @contact.save
      # Store form fields frm the Parameters, into variables
      name = params[:contact][:name] # Goto the contact form and grab the 'name', the user out in.
      email = params[:contact][:email]
      body = params[:contact][:comments]
      # Put the variables into Contact Mailer email mts and send email
      ContactMailer.contact_email(name, email, body).deliver
      # Store message in flash hash and redirect_to 'new' action
      flash[:success] = 'Contact information saved!'
      # rubocop:disable Style/IdenticalConditionalBranches
      redirect_to new_contact_path

    else
      flash[:danger] = @contact.errors.full_messages.join(', ')
      redirect_to new_contact_path
      # rubocop:enable Style/IdenticalConditionalBranches
    end
  end
  #   Whitelist info collected fromm the forms -- meaning ensure info is securely saved to Db
  # To collect data from form, we need to use strong parameters and whitelist the form fields

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :comments)
  end
end

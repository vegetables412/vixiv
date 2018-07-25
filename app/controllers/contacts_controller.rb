class ContactsController < ApplicationController

def index
	@contacts = Contact.all.order(id: "DESC")
end

def show
	@contact = Contact.find(params[:id])
end

def new
	@contact = Contact.new
end

def create
	@contact = Contact.new(contact_params)
	if @contact.save
		redirect_to root_path
	else
		render :new
		@contact = Contact.new(contact_params)
	end
end

def destroy
	contact = Contact.find(params[:id])
	contact.destroy
	redirect_to contacts_path
end

private

def contact_params
	params.require(:contact).permit(:name, :email, :type, :title, :body)
end

end

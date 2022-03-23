class CloseContactsController < ApplicationController
    def create
        @close_contact = CloseContact.new(close_contact_params)
        @close_contact.user_id = current_user.id
        respond_to do |format|
            if @close_contact.save
                format.html {redirect_to @close_contact, notice: 'Close contact was added successfully'}
                format.json {render :show, status: :created, location: @close_contact}
            else
                format.html { render :new}
                format.json { render json: @close_contact.errors, status: :unprocessable_entity}
            end
        end
    end

    def index
        @close_contact = CloseContact.all
    end

    def show
        @close_contact = CloseContact.find(params[:id])
    end

    def new
        @close_contact = CloseContact.new
    end

    def destroy
        @close_contact = CloseContact.find(params[:id])
        @close_contact.destroy
        respond_to do |format|
            format.html { redirect_to close_contacts_url, notice: 'Close contact was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private

    def set_close_contact
        @close_contact = CloseContact.find(params[:id])
    end

    def close_contact_params
        params.require(:close_contact).permit(:name)
    end
end

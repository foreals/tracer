class TestformsController < ApplicationController

    def create
        @testform = Testform.new(testform_params)
        @testform.user_id = current_user.id
        respond_to do |format|
            if @testform.save
                format.html {redirect_to @testform, notice: 'Testform was created successfully'}
                format.json {render :show, status: :created, location: @testform}
            else
                format.html { render :new}
                format.json { render json: @testform.errors, status: :unprocessable_entity}
            end
        end
    end

    def index
        @testform = Testform.all
    end

    def show
        @testform = Testform.find(params[:id])
    end

    def new
        @testform = Testform.new
    end

    private

    def set_testform
        @testform = Testform.find(params[:id])
    end

    def testform_params
        params.require(:testform).permit(:date, :RESULT)
    end

end

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

    describe "new" do
        it "renders the new template" do
            expect(get :new).to render_template "new"
        end
    end

    describe "create" do
        it "should render the users index page" do
            user = create(:user)
            expect(post :create, params: { session: { email: user.email, password: user.password } }).to redirect_to users_path
        end

        it "should rerender the login page if there is an error" do
            user = create(:user)
            expect(post :create, params: { session: { email: user.email, password: "bad password" } }).to redirect_to root_path
            expect(flash[:notice]).to be_present
        end
    end

    describe "destroy" do
        it "should render the new session template" do
            expect(post :destroy).to redirect_to root_path
        end
    end
end
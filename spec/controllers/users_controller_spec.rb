require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    let!(:user) { create(:user) }

    before(:each) do
        allow_any_instance_of(UsersController).to receive(:current_user).and_return(user)
    end

    describe "new" do
        it "renders the new template" do
            expect(get :new).to render_template "new"
        end
    end

    describe "create" do
        it "creates a user with proper user params" do
            post :create, params: { user: attributes_for(:user) }
            expect(response).to be_ok
        end

        it "does not create a new user if the params are not valid" do
            expect{
                post :create, params: { user: { name: 'full name'} } }.to_not change{User.count}
        end

        it "throws errors if the params are not accurate" do
            post :create, params: { user: {first_name: 'first'} }
            expect(:errors).to_not be_nil
        end
    end

    describe "index" do
        it "renders the index template" do
            expect(get :index).to render_template "index"
        end
    end

    describe "show" do
        it "renders the show template" do
            get :show, params: { id: 1 }
            expect(response).to render_template("show")
        end
    end

    describe "edit" do
        it "renders the edit template" do
            get :edit, params: { id: 1 }
            expect(response).to render_template("edit")
        end
    end

    describe "update" do
        it "update the user with proper user params" do
            expect(user.first_name).to eq "firstname"
            expect(user.last_name).to eq "lastname"
            put :update, params: { id: 1, user: { first_name: "newname", last_name: "newname", email: "fakeuser@userapp.com", password: "supersecret", phone_number: "7773339999", role: 'admin'} }
            user.reload
            expect(user.first_name).to eq "newname"
            expect(user.last_name).to eq "newname"
            expect(flash[:notice]).to_not be_present
        end

        it "fails to create a user if user params are not accurate" do
            put :update, params: { id: 1, user: { email: "fakeuser@userapp.com", password: "supersecret", phone_number: "7773339999", role: 'admin'} }
            expect(:errors).to_not be_nil
            expect(user.first_name).to eq "firstname"
            expect(user.last_name).to eq "lastname"
        end
    end

    describe "destroy" do
        it "should delete the user" do
            expect {
                delete :destroy, params: { id: 1 } }.to change{User.count}.by(-1)
        end
    end
end
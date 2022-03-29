require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    subject(:user) {
        FactoryBot.create(:user)
    }
    describe "GET #index" do 
        it "renders the index template" do
            get :index, params: {}
            expect(response).to render_template("index")
            expect(response).to have_http_status(200)
        end
    end
    describe "GET #show" do
        context "with invalid params" do
            it "redirects to the users index page" do
                get :show, params: {
                    id: -1
                }
                expect(response).to have_http_status(302)
                expect(response).to redirect_to "/users"
            end
        end
        context "with valid params " do
            it "should render the show template" do
                get :show, params: {
                    id: user.id
                } 
                expect(response).to have_http_status(200)
                expect(response).to render_template("show")
            end
        end
    end
    describe "GET #new" do
        it "renders the new template" do
            get :new, params: {}
            expect(response).to have_http_status(200)
            expect(response).to render_template("new")
        end
    end
    describe "POST #create" do
        context "with invalid params" do
            it "validates the presence of email and password" do
                post :create, params: {
                    users: {
                        :email => "test@example.com",
                        :password => ""
                    }
                }
                expect(response).to render_template("new")
                expect(flash[:errors]).to be_present
            end
            it "validates the length of the password should be greather than = 6" do
                post :create, params: {
                    users: {
                        :email => "test@example.com",
                        :password => "test"
                    }
                }
                expect(response).to render_template("new")
                expect(flash[:errors]).to be_present
            end
        end
        context "with valid params" do
            it "should redirect to the index page with success " do
                post :create, params: {
                    users: {
                        username: "hassantarif",
                        email: "test@test.co",
                        birth_date: 1990,
                        password: "password",
                    }
                }
                expect(response).to redirect_to user_path(User.last)
            end
        end
    end
end

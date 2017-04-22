require 'rails_helper'

RSpec.describe BooksController, :type => :controller do

  before(:each) do
    expect(controller).to receive(:authenticate_user!).and_return(User.create({password:"password"}))
  end
  
  describe "GET #new" do
    it "returns http success" do
      # expect(controller).to receive(:authenticate_user!).and_return(User.create({password:"password"}))
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders a new template" do
      # expect(controller).to receive(:authenticate_user!).and_return(User.create({password:"password"}))
      # user = double('user')
      # allow(request.env['warden']).to receive(:authenticate_user!).and_return(user)
      # allow(controller).to receive(:current_user).and_return(user)
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "GET #create" do
    it "returns http success" do
      # expect(controller).to receive(:authenticate_user!).and_return(User.create({password:"password"}))
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "return http success" do
      # expect(controller).to receive(:authenticate_user!).and_return(User.create({password:"password"}))
      expect(Book).to receive(:find).with("1").and_return(Book.new({name: "ABC", author_name: "Author"}))
      get :show, :id => 1
      expect(response.status).to eq 200
    end

    it "renders show template" do
      # expect(controller).to receive(:authenticate_user!).and_return(User.create({password:"password"}))
      expect(Book).to receive(:find).with("1").and_return(Book.new({name: "ABC", author_name: "Author"}))
      get :show, :id => 1
      expect(response).to render_template("show")
    end
  end


  describe "GET #Index" do
    it "returns http success" do
      # expect(controller).to receive(:authenticate_user!).and_return(User.create({password:"password"}))
      expect(Book).to receive(:all).and_return(Book.new({name:"Some Book", author_name: "Some Author"}))
      get :index
      expect(response.status).to eq 200
    end

    it "renders index template" do
      # expect(controller).to receive(:authenticate_user!).and_return(User.create({password:"password"}))
      expect(Book).to receive(:all).and_return(Book.new({name:"Some Book", author_name: "Some Author"}))
      get :index
      expect(response).to render_template("index")
    end

    it "returns http success for the search" do
      # expect(controller).to receive(:authenticate_user!).and_return(User.create({password:"password"}))
      expect(Book).to receive(:search).with("Some").and_return(Book.new({name:"Some Book", author_name: "Some Author"}))
      get :index, :search=>:Some
      expect(response.status).to eq 200
      end

    it "returns http success for the search" do
      # expect(controller).to receive(:authenticate_user!).and_return(User.create({password:"password"}))
      expect(Book).to receive(:search).with("Some").and_return(nil)
      get :index, :search=>:Some
      expect(response.status).to eq 200
    end
  end

  describe "GET #Edit" do
    it "returns http success for editing the book" do
      # expect(controller).to receive(:authenticate_user!).and_return(User.create({password:"password"}))
      expect(Book).to receive(:find).with("1").and_return(Book.new({name: "ABC", author_name: "Author"}))
      get :edit, :id => 1
      expect(response.status).to eq 200
    end
  end

  describe "PUT #Update" do
    it "returns http success after updating the book" do
      # expect(controller).to receive(:authenticate_user!).and_return(User.create({password:"password"}))
      book = Book.new({name: "ABC", author_name: "Author"})
      expect(Book).to receive(:find).with("1").and_return(book)
      put :update, :id => 1
      expect(response.status).to eq 302
    end

    it "renders show after editing the book" do
      # expect(controller).to receive(:authenticate_user!).and_return(User.create({password:"password"}))
      book = Book.new({name: "ABC", author_name: "Author"})
      expect(Book).to receive(:find).with("1").and_return(book)
      expect(book).to receive(:update_attributes).and_return(true)
      put :update, :id => 1
      expect(response).should redirect_to(book)
    end
  end

  describe "DELETE #Destroy" do
    it "returns http success after deleting the book" do
      # expect(controller).to receive(:authenticate_user!).and_return(User.create({password:"password"}))
      book = Book.new({name: "ABC", author_name: "Author"})
      expect(Book).to receive(:find).with("1").and_return(book)
      expect(book).to receive(:destroy).and_return(book)
      delete :destroy, :id=>1
      expect(response.status).to eq 302
      end

    it "renders books url after deleting a book" do
      # expect(controller).to receive(:authenticate_user!).and_return(User.create({password:"password"}))
      book = Book.new({name: "ABC", author_name: "Author"})
      expect(Book).to receive(:find).with("1").and_return(book)
      expect(book).to receive(:destroy).and_return(book)
      delete :destroy, :id=>1
      expect(response).should redirect_to(book)
    end
  end

end

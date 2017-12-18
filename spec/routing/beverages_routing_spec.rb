require "rails_helper"

RSpec.describe BeveragesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/beverages").to route_to("beverages#index")
    end


    it "routes to #show" do
      expect(:get => "/beverages/1").to route_to("beverages#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/beverages").to route_to("beverages#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/beverages/1").to route_to("beverages#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/beverages/1").to route_to("beverages#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/beverages/1").to route_to("beverages#destroy", :id => "1")
    end

  end
end

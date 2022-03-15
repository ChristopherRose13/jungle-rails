require 'rails_helper'
require "product"
require "category"

RSpec.describe Product, type: :model do

  # before do
  #   # @category = Category.new(:name => "test")
  #   # @product = Product.new(:name => "product", :description => "description", :price_cents => 1000, :quantity => 10, :category_id => 1)
  # end

  describe "Validations" do

    it "should save a product" do 
      @category = Category.create(:name => "test")
      product =  Product.new(:name => "name", :description => "description", :price_cents => 1000, :quantity => 10, :category_id => @category.id)

      # puts @product.category
      product.validate
      expect(product.errors.full_messages).to match_array([])
    end


    it "name should exist" do 
      @category = Category.new(:name => "test")
      @product = Product.new(:name => nil, :description => "description", :price_cents => 1000, :quantity => 10, :category_id => 1)

      @product.name = nil
      puts @product.category_id
      @product.validate
      expect(@product.errors.full_messages).to include ("Name can't be blank")
    end
    

    it "price should exist" do
      @product = Product.new(:name => "product", :description => "description", :price_cents => nil, :quantity => 10, :category_id => 1)
      @product.validate
      expect(@product.errors.full_messages).to include ("Price can't be blank")
    end
    
    it "quantity should exist" do
      @product = Product.new(:name => "product", :description => "description", :price_cents => 1000, :quantity => nil, :category_id => 1)
      @product.validate
      expect(@product.errors.full_messages).to include ("Quantity can't be blank")
    end

    it "category should exist" do
      @product = Product.new(:name => "product", :description => "description", :price_cents => 1000, :quantity => 10, :category_id => nil)
      @product.validate
      expect(@product.errors.full_messages).to include ("Category can't be blank")
    end
  end
end

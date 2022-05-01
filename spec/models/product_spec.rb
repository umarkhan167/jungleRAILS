require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is valid" do
      @product = Product.new
      @cat = Category.new
      @cat.name = 'Test'
      @product.name = 'Test' 
      @product.price_cents = 12311
      @product.quantity = 3
      @product.category = @cat
      expect(@product.valid?).to be true
    end

    it "quantity" do
      @product = Product.new
      @product.quantity = nil
      @product.valid?
      expect(@product.errors[:quantity]).to  include("cannot be blank")
  
      @product.quantity = 3
      @product.valid? 
      expect(@product.errors[:quantity]).not_to  include("cannot be blank")
    end
  end
  it "name is present" do
    @product = Product.new
    @product.name = nil
    @product.valid?
    expect(@product.errors[:name]).to  include("cannot be blank")

    @product.name = 'test' 
    @product.valid? 
    expect(@product.errors[:name]).not_to  include("cannot be blank")
  end

  it "price_cents is present" do
    @product = Product.new
    @product.price_cents = nil 
    @product.valid?
    expect(@product.errors[:price_cents]).to  include("is not a number")

    @product.price_cents = 12311
    @product.valid? 
    expect(@product.errors[:price_cents]).not_to  include("cannot be blank")
  end

  it "has category_id" do
    @cat = Category.new
    @product = Product.new
    @product.category = nil
    @product.valid?
    expect(@product.errors[:category]).to  include("cannot be blank")

    @product.category = @cat 
    @product.valid? 
    expect(@product.errors[:category]).not_to  include("cannot be blank")
  end
end
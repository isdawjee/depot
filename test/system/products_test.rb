require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "should create product" do
    visit products_url
    click_on "Add New Product"

    fill_in "Description", with: @product.description
    fill_in "Price", with: @product.price
    fill_in "Title", with: "Product Test #{Time.now.to_i}"
    attach_file "Image", Rails.root.join("test/fixtures/files/lorem.jpg")
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "should update Product" do
    visit product_url(@product)
    click_on "Edit product", match: :first

    fill_in "Description", with: @product.description
    fill_in "Price", with: @product.price
    fill_in "Title", with: "Updated Product #{Time.now.to_i}"
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "should destroy Product" do
    visit product_url(@product)
    accept_confirm { click_on "Delete product", match: :first }

    assert_text "Product was successfully destroyed"
  end
end

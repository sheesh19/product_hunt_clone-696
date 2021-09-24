require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url
  
    assert_selector "h1", text: "Awesome Products"
    assert_selector ".card-product", count: Product.count
  end

  test "lets a user sign in and create a product" do
    # set up
    login_as users(:george)
    visit "/products/new"

    #exercise
    fill_in "product_name", with: "Le Wagon"
    fill_in "product_tagline", with: "Change your life: Learn to code"

    click_on "Create Product"
    save_and_open_screenshot

    #verify
    assert_equal root_path, page.current_path
    assert_text "Change your life: Learn to code"
  end
end

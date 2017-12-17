require 'rails_helper'

RSpec.feature "Admin item creation" do
  let!(:role)             {create(:role, name: 'platform admin')}
  let!(:admin)            {create(:user, email: "admin@example.com")}
  let!(:user_role_store)  {create(:user_role_store, user: admin, role: role)}
  let!(:item)             { create(:item) }
  let!(:category)         { create(:category) }

  context "As an authenticated admin" do
    it "I can create an item" do
      stub_logged_in_user(admin)

      visit admin_items_path
      
      click_on "Create New Item"
      fill_in "item[title]", with: "Onesie"
      fill_in "item[description]", with: "This Onesie is awesome!"
      fill_in "item[price]", with: "59.99"
      page.attach_file("item[image]", testing_image)
      click_on "Create Item"

      expect(current_path).to eq(admin_items_path)
      expect(page).to have_content("Onesie")
      expect(page).to have_content("59.99")
    end

    it "I can create an item without an image and it defaults" do
      stub_logged_in_user(admin)
      visit admin_items_path

      click_on "Create New Item"
      fill_in "item[title]", with: "Onesie"
      fill_in "item[description]", with: "This Onesie is awesome!"
      fill_in "item[price]", with: "59.99"
      click_on "Create Item"

      expect(current_path).to eq(admin_items_path)
      expect(page).to have_content("Onesie")
      expect(page).to have_content("59.99")
    end
  end
end

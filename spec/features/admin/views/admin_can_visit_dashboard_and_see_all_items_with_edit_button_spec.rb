require 'rails_helper'

RSpec.describe 'an admin can visit admin dashboard' do
  describe 'and see a link for all items' do
    it 'when clicked that link should be the admin item index with admin functionality' do
      user = create(:user, password: 'LOGIN')
      store = create(:store)
      user.user_role_stores.create(role: Role.create(name: 'store_admin'), store: store)
      login_user(user.email, 'LOGIN')

      item_one, item_two = create_list(:item, 2, category: create(:category), store: store)

      visit admin_dashboard_index_path

      click_on "View Items"

      expect(page).to have_content(item_one.title)
      expect(page).to have_content(item_one.price)
      expect(page).to have_content(item_two.title)
      expect(page).to have_content(item_two.price)
      expect(page).to have_content("Edit")
    end
  end
end

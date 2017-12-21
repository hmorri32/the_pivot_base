require 'rails_helper'

RSpec.describe "admin analytics" do
  it "can return most popular items" do
    item1, item2 = create_list(:item, 2, price: 30.00)
    item3 = create(:item, price: 50.00)
    order1, order3 = create_list(:order, 2, status: "paid")
    order2 = create(:order, status: "cancelled")
    order_item1 = create(:order_item, quantity: 2, item: item1, order: order1)
    order_item2 = create(:order_item, quantity: 2, item: item2, order: order2)
    order_item3 = create(:order_item, quantity: 1, item: item3, order: order3)
    items = AdminAnalyticsPresenter.new.most_popular_items(3)

    expect(items[0]).to eq(item1)
    expect(items[1]).to eq(item3)
    expect(item2).to_not be_in(items)
  end
end

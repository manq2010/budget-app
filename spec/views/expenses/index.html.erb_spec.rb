require 'rails_helper'

RSpec.describe "expenses/index", type: :view do
  before(:each) do
    assign(:expenses, [
      Expense.create!(
        name: "Name",
        amount: false,
        user: nil,
        group: nil
      ),
      Expense.create!(
        name: "Name",
        amount: false,
        user: nil,
        group: nil
      )
    ])
  end

  it "renders a list of expenses" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end

require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name",
        :location => "Location",
        :age => 2,
        :email => "test.email@yahoo.co"
      ),
      User.create!(
        :name => "Name",
        :location => "Location",
        :age => 2,
        :email => "test.email@gmail.com"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "test.email@gmail.com".to_s, :count => 1
    assert_select "tr>td", :text => "test.email@yahoo.co".to_s, :count => 1
  end
end

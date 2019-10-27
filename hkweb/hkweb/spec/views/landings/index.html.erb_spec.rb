require 'rails_helper'

RSpec.describe "landings/index", type: :view do
  before(:each) do
    assign(:landings, [
      Landing.create!(
        :name => "Name",
        :url => "Url",
        :group => "Group"
      ),
      Landing.create!(
        :name => "Name",
        :url => "Url",
        :group => "Group"
      )
    ])
  end

  it "renders a list of landings" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Group".to_s, :count => 2
  end
end

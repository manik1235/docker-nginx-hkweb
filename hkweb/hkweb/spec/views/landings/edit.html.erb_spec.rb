require 'rails_helper'

RSpec.describe "landings/edit", type: :view do
  before(:each) do
    @landing = assign(:landing, Landing.create!(
      :name => "MyString",
      :url => "MyString",
      :group => "MyString"
    ))
  end

  it "renders the edit landing form" do
    render

    assert_select "form[action=?][method=?]", landing_path(@landing), "post" do

      assert_select "input[name=?]", "landing[name]"

      assert_select "input[name=?]", "landing[url]"

      assert_select "input[name=?]", "landing[group]"
    end
  end
end

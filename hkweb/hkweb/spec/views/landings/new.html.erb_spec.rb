require 'rails_helper'

RSpec.describe "landings/new", type: :view do
  before(:each) do
    assign(:landing, Landing.new(
      :name => "MyString",
      :url => "MyString",
      :group => "MyString"
    ))
  end

  it "renders new landing form" do
    render

    assert_select "form[action=?][method=?]", landings_path, "post" do

      assert_select "input[name=?]", "landing[name]"

      assert_select "input[name=?]", "landing[url]"

      assert_select "input[name=?]", "landing[group]"
    end
  end
end

require 'rails_helper'

RSpec.describe "landings/show", type: :view do
  before(:each) do
    @landing = assign(:landing, Landing.create!(
      :name => "Name",
      :url => "Url",
      :group => "Group"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/Group/)
  end
end

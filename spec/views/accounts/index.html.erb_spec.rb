require 'spec_helper'

describe "accounts/index.html.erb" do
  before(:each) do
    assign(:accounts, [
      stub_model(Account,
        :name => "Name",
        :user_id => 1
      ),
      stub_model(Account,
        :name => "Name",
        :user_id => 1
      )
    ])
  end

  it "renders a list of accounts" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
  end
end

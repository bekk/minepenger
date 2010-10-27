require 'spec_helper'

describe "accounts/edit.html.erb" do
  before(:each) do
    @account = assign(:account, stub_model(Account,
      :new_record? => false,
      :name => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit account form" do
    render

    rendered.should have_selector("form", :action => account_path(@account), :method => "post") do |form|
      form.should have_selector("input#account_name", :name => "account[name]")
      form.should have_selector("input#account_user_id", :name => "account[user_id]")
    end
  end
end

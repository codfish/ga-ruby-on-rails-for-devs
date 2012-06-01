require 'spec_helper'

describe "things/new.html.haml" do

  before(:each) do
    assign(:thing, Thing.new)
  end

  it "renders new thing form" do
    render
    view.should render_template(:partial => "_form")
    rendered.should have_selector "form", { :action => things_path, :method => "post" }  do |form|
    	form.should have_selector "input", { :name => "thing[name]", :type => "text" } 
    end
  end
  
end

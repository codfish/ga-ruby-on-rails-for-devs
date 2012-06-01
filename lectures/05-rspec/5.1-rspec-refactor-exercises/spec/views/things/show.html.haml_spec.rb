require 'spec_helper'

describe "things/show.html.haml" do

  before(:each) do
  	@thing = Fabricate(:thing)
    #assign(:thing, Fabricate(:thing))
  end

  it "renders a thing" do
  	render
    assert_select "h1", text: @thing.name, count: 1
  end

end

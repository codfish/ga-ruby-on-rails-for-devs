require 'spec_helper'

describe ThingsController do  
   	
 	describe "GET index" do
		
		let(:thing) { Fabricate(:thing) }
 	  
 	  before(:each) do
 	  	get "index"
 	  end
 	  
 	  it "assigns all things to @things" do
 	    assigns(:things).should eq(Thing.all)
 	  end

		it { should render_template "index" }

 	end
 	
 	describe "GET new" do
		
		let(:thing) { Fabricate(:thing) }
 	  
 	  before(:each) do
 	  	get "new"
 	  end
 	  
		it "assigns new thing to @thing" do 
			assigns(:thing).class.should == Thing
		end
		
		it { should render_template "new" } 
 	end
 	 
	describe "GET show" do
	
		context "with a valid id" do # why is this describe, and not context? doesn't context make for sense?
		
			before(:each) do	
				@thing = Fabricate(:thing)
				get "show", :id => @thing.to_param
			end
			
			it "assigns requested thing to @thing" do
				assigns(:thing).should be_true
				assigns(:thing).id.should == @thing.id
			end
			
			it { should render_template "show" }
						
		end
	
		context "with an invalid id" do
		
			before(:each) do	
				get "show", :id => "2324"
			end
			
			it "does not assign requested thing to @thing" do
				assigns(:thing).should be_nil
			end
			
			it { response.code.should == "404" }
						
		end
	
	end

	describe "GET edit" do
	
		before(:each) do	
			@thing = Fabricate(:thing)
			get "edit", :id => @thing.id.to_s
		end
		
		it "assigns requested thing to @thing" do
			assigns(:thing).should be_true
			assigns(:thing).id.should == @thing.id
		end
		
		it { should render_template "edit" }
	
	end
	   	
	describe "PUT update" do
	
		# let(:thing) { Fabricate(:thing) }
		
		before(:each) do
			@thing = Fabricate(:thing)
			put "update", { :id => @thing.id.to_s, :thing => { 'name' => 'Updated Name' } }	
		end
		
		it "updates a single thing" do
			@thing.reload.name.should == 'Updated Name'
		end
		
		it { should redirect_to @thing } # why is this nil when using let, but still passes? 
		
	end
 	
	describe "DELETE destroy" do
	
		let(:thing) { Fabricate(:thing) }
		
		before(:each) do
			delete "destroy", { :id => thing.id.to_s}
		end
		
		it "deletes a thing" do
			Thing.count.should == 0
		end
		
		it { should redirect_to things_url }
		
	end
 	  
end # /end thing controller spec

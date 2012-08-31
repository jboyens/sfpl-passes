require 'spec_helper'

describe SFPL::Passes do
  it { should respond_to :available }
  it { should respond_to :due }

  describe "#available" do
    before do
      stub_request(:get, "http://sflib1.sfpl.org/record=b2318142~S1").
        to_return(:status => 200, :body => load_fixture('exploratorium.html'), :headers => {'Content-Type' => 'text/html'})

      stub_request(:post, "http://sflib1.sfpl.org/search~S1?/.b2318142/.b2318142/1,1,1,B/holdings~2318142&1,0,&FF=").
             to_return(:status => 200, :body => load_fixture('exploratorium_page-2.html'), :headers => {'Content-Type' => 'text/html'})
    end

    it "should return a list of passes available at each library" do
      avail = SFPL::Passes.available(:exploratorium)

      avail.size.should == 1

      first = avail.first
      first.should have_key :exploratorium
    end
  end
end

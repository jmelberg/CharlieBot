require 'rspec'
require './charlie_bot'

describe CharlieBot do

  let(:message_hash){{
      :user => 'Alan',
      :message => 'You are awesome!'
    }}

  let(:charlie_bot){CharlieBot.new}

  

  it 'should have a read message method' do
    val = message_hash[:message]
    expect(val).to eq 'You are awesome!'
    
  end

  # # it 'should say hello when i tell it hello' do
  # #   pending
  # #   charlie = CharlieBot.new
  # #   return_string = charlie.say_hello('Alan')
  # #   expect(return_string).to eq 'Hello Alan!'
  # # end

  

  describe 'keeping track of weekly prayer requests' do

    before :all do
      @charlie_bot = CharlieBot.new
    end

    it 'should keep a list of prayer requests' do
      expect(@charlie_bot.prayer_requests).to be_a(Array)
    end

    it 'should be able to add a prayer request' do
      expect(@charlie_bot.prayer_requests.count).to eq 0
      @charlie_bot.add_prayer(:user => 'Alan', :request => 'Live until 50')
      expect(@charlie_bot.prayer_requests.count).to eq 1
      expect(@charlie_bot.prayer_requests[0][:user]).to eq 'Alan'
    end

    it 'should have a delete_all prayer_requests method' do
      expect(@charlie_bot.prayer_requests.count).to_not eq 0
      @charlie_bot.delete_all_prayers()
      expect(@charlie_bot.prayer_requests.count).to eq 0
    end

    describe 'should eat and parse messages' do

      it 'should know that a message is valid to respond to' do
        charlie_bot = CharlieBot.new
        expect(charlie_bot.prayer_requests.count).to eq 0
        charlie_bot.eat_message('$CharlieBot add prayer <Live Until 50>')
        expect(charlie_bot.prayer_requests.count).to eq 1
        expect(charlie_bot.prayer_requests[0][:request]).to eq 'Live Until 50'
      end

      it "should know when a message is not valid" do
        charlie_bot = CharlieBot.new
        expect(charlie_bot.prayer_requests.count).to eq 0
        expect(charlie_bot).to receive(:send_error_message).once
        
        charlie_bot.eat_message("$CharlieBot chase oliver")
        expect(charlie_bot.prayer_requests.count).to eq 0
      end

      # it 'should delete a single message if you ask it to' do 
      #   charlie_bot = CharlieBot.new
      #   expect(charlie_bot.prayer_requests.count).to_not eq 0
      #   charlie_bot.delete_one_prayer('Live Until 50')
      #   expect(charlie_bot.prayer_requests).to eq 0
      # end
    end
  end
end



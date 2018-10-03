require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'Realtionships' do 
    it { should belong_to :customer }
    it { should belong_to :merchant }
    it { should have_many :invoice_items }
    it { should have_many :items }
    it { should have_many :transactions }
  end 
end
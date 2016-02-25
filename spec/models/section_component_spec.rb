require 'rails_helper'

RSpec.describe SectionComponent, type: :model do
    context 'parametrs' do
    it { should belong_to(:section)    }
    it { should belong_to(:component) }
  end
end

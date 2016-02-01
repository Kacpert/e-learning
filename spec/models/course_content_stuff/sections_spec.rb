RSpec.describe Section, type: :model do
  before do
    @section = create(:section)
  end

  context 'parametrs' do
    it { should respond_to(:name) }
    it { should respond_to(:image) }
    it { should respond_to(:short_description) }
    it { should respond_to(:author) }
  end

  # context 'validates' do
  #   it { should validate_presence_of(:name) }
  #   it { should validate_presence_of(:description)}
  # end
end
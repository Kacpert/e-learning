RSpec.shared_examples "removeable" do |obj_class|
  it "Shoul be removeable" do
    obj_class.all.destroy_all
    expect(obj_class.all.size).to eq(0)
  end
end

RSpec.shared_examples 'many to many with content' do
  it 'with Content association many to many' do
    subject.contents << create(:content, name: 'name')
    expect(subject.contents.first.name).to eq('Content name') 
    expect(subject.contents.second.name).to eq('name') 
  end
end
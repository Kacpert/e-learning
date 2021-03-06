require 'rails_helper'

RSpec.describe Course, type: :model do
  before do
    @course = create(:course)
    #@course.sequences << [create(:sequence), create(:sequence, order: 2)]
  end

  context 'parametrs' do
    it { should respond_to(:name)              }
    it { should respond_to(:user)              }
    it { should respond_to(:order)             }
    it { should respond_to(:image)             }
    it { should respond_to(:author)            }
    it { should respond_to(:temporal)          }
    it { should respond_to(:sections)          }
    it { should respond_to(:image_url)         }
    it { should respond_to(:categories)        }
    it { should respond_to(:description)       }
    it { should respond_to(:short_description) }
  end

  context 'validates' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:short_description) }
  end



  describe "when #new" do
    it 'should have valid name' do
      expect(@course.name).to eq('New course')
    end

    it 'should have valid description' do
      expect(@course.description).to eq('some desc')
    end

    # it 'should have two lessons' do
    #   expect(@course.sequences.size).to eq(2)
    # end
  end

  describe "when #new" do
    it "should not be created without name and description" do
      expect(build(:course, name: nil, description: nil, user: User.first)).to_not be_valid
    end
  end

  include_examples 'removeable', Course
end


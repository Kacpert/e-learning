require 'rails_helper'

describe User do
  before { @user = FactoryGirl.build(:user) }

  subject { @user }

  it { should respond_to(:email)                 }
  it { should respond_to(:password)              }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:groups)                }
  it { should respond_to(:groups_users)          }
  it { should respond_to(:conversations)         }
  it { should respond_to(:conversations_users)   }
  

  it { should be_valid }

  it { should validate_presence_of(:email) }
  it { should validate_confirmation_of(:password) }
  it { should allow_value('example@domain.com').for(:email) }

  it { should respond_to(:auth_token) }
  it { should validate_uniqueness_of(:auth_token)}

  describe "#generate_authentication_token!" do
    it "generates a unique token" do
      allow(Devise).to receive(:friendly_token).and_return("auniquetoken123")
      @user.generate_authentication_token!
      expect(@user.auth_token).to eql "auniquetoken123"
    end

    it "generates another token when one already has been taken" do
      existing_user = FactoryGirl.create(:user, auth_token: "auniquetoken123")
      @user.generate_authentication_token!
      expect(@user.auth_token).not_to eql existing_user.auth_token
    end
  end
end








# require 'rails_helper'

# RSpec.describe User, type: :model do
#   before do
#     @admin = create(:admin)
#     @user = create(:user)
#   end

#   describe "when #create" do
#     context 'admin' do
#       it "should have valid email" do
#         expect(@admin.email).to eq('admin@admin.com')
#       end

#       it "should have valid first_name" do
#         expect(@admin.first_name).to eq('Admin')
#       end

#       it "should have valid last_name" do
#         expect(@admin.last_name).to eq('Doel')
#       end

#       it "should have valid admin" do
#         expect(@admin.admin).to eq(true)
#       end
#     end

#     context 'user' do
#       it "should have valid email" do
#         expect(@user.email).to eq('john@gmail.com')
#       end

#       it "should have valid first_name" do
#         expect(@user.first_name).to eq('John')
#       end

#       it "should have valid last_name" do
#         expect(@user.last_name).to eq('Doel')
#       end

#       it "should have valid admin" do
#         expect(@user.admin).to eq(false)
#       end
#     end
#   end

#   describe "when #update" do
#     context 'user' do
#       it "should be admin" do
#         @user.update(admin: true)
#         expect(@user.admin).to eq(true)
#       end

#       it "should have valid last_name" do
#         @user.update(last_name: 'Toe')
#         expect(@user.last_name).to eq('Toe')
#       end

#       it "should have valid first_name" do
#         @user.update(first_name: 'Michael')
#         expect(@user.first_name).to eq('Michael')
#       end
#     end
#   end

#   describe "when #destroy" do
#     it "should be deletable" do
#       @user.destroy
#       @admin.destroy
#       expect(User.all.size).to eq(0)
#     end
#   end
# end

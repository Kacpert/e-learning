require 'rails_helper'

RSpec.describe GroupsUser, type: :model do
  it { should respond_to(:user ) }
  it { should respond_to(:group) }
end

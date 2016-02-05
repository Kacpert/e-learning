require 'rails_helper'

RSpec.describe Group, type: :model do
  it { should respond_to(:users) }
  it { should respond_to(:groups_users) }
  it { should respond_to(:course) }
end

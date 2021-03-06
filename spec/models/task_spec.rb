require 'rails_helper'

RSpec.describe Task, type: :model do
  it do
    should define_enum_for(:status).with([:todo, :done, :archived])
  end

  it { should validate_presence_of :name }
end

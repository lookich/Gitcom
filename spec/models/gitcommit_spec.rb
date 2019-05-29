# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Gitcommit, type: :model do
  context "validation tests" do
    it { should validate_presence_of(:owner) }
    it { should validate_presence_of(:repo) }
  end
end

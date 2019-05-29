# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

module RequestHelpers
  def create_logged_in_user
    user = FactoryBot.create(:user)
    login(user)
  end
  def login(user)
    visit api_v1_signin_path
    fill_in "Nickname", with: user.nickname
    fill_in "Password", with: user.password
    click_button "Sign in"
  end
end

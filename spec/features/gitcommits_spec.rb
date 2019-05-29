# frozen_string_literal: true

require 'rails_helper'
require_relative '../support/request_helpers'
include RequestHelpers

describe 'Gitcommits features' do
  it 'Visiting index page', type: :request do
    visit api_v1_gitcommits_path
    expect(page).to have_content I18n.t('gitcommits.index')
  end
end

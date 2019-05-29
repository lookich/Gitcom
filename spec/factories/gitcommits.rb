# frozen_string_literal: true

FactoryBot.define do
  factory :gitcommit do
    owner { '1' }
    repo { 'repo' }
    author_email  { 'mario@email.com' }
    commit_url { 'https://github.com/thoughtbot/guides/archive/daf696183c3c94a7c00feae8443c7921752551b8.zip' }
    commit_message { 'DateTime.now' }
  end
end

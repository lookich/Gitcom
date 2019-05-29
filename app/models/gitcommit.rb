class Gitcommit < ApplicationRecord
  validates :owner, presence: true
  validates :repo, presence: true
  paginates_per 10
end

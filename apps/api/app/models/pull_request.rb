class PullRequest < ApplicationRecord
  belongs_to :repository
  belongs_to :author, class_name: 'User'
  has_many :reviews

  validates :number, presence: true, uniqueness: { scope: :repository_id }
  validates :title, presence: true
  validates :state, presence: true
  validates :github_id, presence: true, uniqueness: true
  validates :head_sha, presence: true
  validates :base_sha, presence: true

  enum state: { open: 'open', closed: 'closed', merged: 'merged' }
end
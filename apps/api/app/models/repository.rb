class Repository < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :pull_requests

  validates :name, presence: true
  validates :full_name, presence: true, uniqueness: true
  validates :github_id, presence: true, uniqueness: true
end
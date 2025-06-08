class User < ApplicationRecord
  has_many :repositories, foreign_key: :owner_id
  has_many :pull_requests, foreign_key: :author_id
  has_many :reviews, foreign_key: :reviewer_id

  validates :email, presence: true, uniqueness: true
  validates :github_id, presence: true, uniqueness: true
  validates :github_username, presence: true

  encrypts :github_token

  def self.from_omniauth(auth)
    find_or_create_by(github_id: auth.uid) do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.github_username = auth.info.nickname
      user.avatar_url = auth.info.image
      user.github_token = auth.credentials.token
    end
  end
end
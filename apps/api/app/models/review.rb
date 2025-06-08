class Review < ApplicationRecord
  belongs_to :pull_request
  belongs_to :reviewer, class_name: 'User'
  has_many :review_comments
  has_many :code_embeddings

  validates :status, presence: true
  validates :overall_score, presence: true, inclusion: { in: 1..10 }

  enum status: { pending: 'pending', completed: 'completed', failed: 'failed' }
end
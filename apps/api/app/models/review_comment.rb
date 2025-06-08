class ReviewComment < ApplicationRecord
  belongs_to :review

  validates :file_path, presence: true
  validates :comment, presence: true
  validates :severity, presence: true

  enum severity: { info: 'info', warning: 'warning', error: 'error', critical: 'critical' }
end

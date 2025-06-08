class CodeEmbedding < ApplicationRecord
  belongs_to :review
  
  validates :file_path, presence: true
  validates :content_hash, presence: true
  validates :embedding, presence: true

  has_neighbors :embedding
end
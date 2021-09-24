class Tip < ApplicationRecord
  belongs_to :user
  has_many   :comments, dependent: :destroy
  
  has_and_belongs_to_many :users

  validates :title, presence: true,
                    length: { maximum: 100 }
  validates :body,  presence: true

  scope :title_contains,          ->(term) { where('title LIKE ?', "%#{term}%") } 
  scope :body_contains,           ->(term) { where('body LIKE ?', "%#{term}%") } 
  scope :search,                  ->(search_term) { title_contains(search_term).or(body_contains(search_term)) }
  scope :most_new,                -> { order(updated_at: :desc).limit(4) }
  scope :creator,                 ->(id) { where("user_id = #{id}") }

  paginates_per 8

end

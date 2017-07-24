class Post < ActiveRecord::Base
  validates :title, presence: true
  validates(:content, { :length => { minimum: 250 } })
  validates(:summary, { :length => { maximum: 250 } })
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :if_clickbait



  def if_clickbait
    titles = /(Won't Believe|Secret|Top|Guess)/i
    if !titles.match(title)
      errors.add(:title, "is clickbait")
    end
  end


end

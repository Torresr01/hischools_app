class School < ActiveRecord::Base
  validates :address, :total, :schooltype, :city, :state, :url, presence: true
  validates :name, :uniqueness => true

  has_many :comments
  validates :name, presence: true,
                    length: { minimum: 5 }

  def self.search(search)
    	where('title LIKE :search', :search => "%#{search}%")
  end
end
class School < ActiveRecord::Base
  validates :name, :address, :total, :schooltype, :city, :state, :url, presence: true

  def self.search(search)
    	where('title LIKE :search', :search => "%#{search}%")
  end
end
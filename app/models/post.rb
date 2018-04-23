class Post < ApplicationRecord
  validates_inclusion_of :status, :in => ["publish", "draft"]
  validates_inclusion_of :permit, :in => ["all", "friend", "myself"]

  belongs_to :category
  belongs_to :user

  has_many :replies, dependent: :destroy

  has_many :vieweds, dependent: :destroy

  def self.all_publish 
    where( :status => 'publish', :permit => 'all' ).all
  end

end

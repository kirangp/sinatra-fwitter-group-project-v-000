class User < ActiveRecord::Base
  has_many :tweets
  has_secure_password
  validates_uniqueness_of :email
  validates_presence_of :username, :email, :password

  def slug
    self.username.gsub(" ", "-").downcase
  end

  def find_by_slug(slug)
    self.all.detect { |item| item.slug == slug}
  end
end
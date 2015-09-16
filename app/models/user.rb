class User < ActiveRecord::Base
  
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	
	has_secure_password
	has_many :events
	has_many :comments

  
  

	has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
	has_many :passive_relationships, class_name:  "Relationship",
	                                   foreign_key: "followed_id",
	                                   dependent:   :destroy
	has_many :following, through: :active_relationships,  source: :followed
	has_many :followers, through: :passive_relationships, source: :follower

 # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.delete(followed_id: other_user.id)
  end

  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :user_id"
    Event.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
  end



end

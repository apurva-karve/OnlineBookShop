class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title #The attributes that can be updated in the bulk. (ex. via update_attributes)

  validates :name, :presence => true
  validates :title, :presence => true, :length => { :minimum => 5}

  has_many :comments, :dependent => :destroy #This will delete the associated comments when the post is deleted.
end


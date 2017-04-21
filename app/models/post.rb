class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title, :tags_attributes#The attributes that can be updated in the bulk. (ex. via update_attributes)
  #If tags_attributes is not added it will give MassAssignmentSecurityException when we try to update tags through post model.

  validates :name, :presence => true
  validates :title, :presence => true, :length => { :minimum => 5}

  has_many :comments, :dependent => :destroy #This will delete the associated comments when the post is deleted.
  has_many :tags

  accepts_nested_attributes_for :tags, :allow_destroy => :true, #tells rails to destroy tags through nested attributes
      :reject_if => proc{ |attrs| attrs.all?{ |k,v| v.blank?}} #prevents saving new tags through post model.
end


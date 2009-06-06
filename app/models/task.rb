class Task < ActiveRecord::Base

  validates_presence_of :name
  validates_uniqueness_of :name, :slug
  slug_from :name

end

class Task < ActiveRecord::Base

  validates_presence_of :name
  slug_from :name

end

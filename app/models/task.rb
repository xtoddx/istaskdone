class Task < ActiveRecord::Base

  validates_presence_of :name
  validates_uniqueness_of :name, :slug
  slug_from :name

  attr_accessor :update_webcode, :update_cookiecode

  before_update :revert_changes_unless_access_code_match

  private
  def revert_changes_unless_access_code_match
    unless webcode_match? or cookiecode_match?
      changes.each do |key, vals|
        self.send("#{key}=", vals.first)
      end
    end
  end

  def webcode_match?
    update_webcode and update_webcode == webcode
  end

  def cookiecode_match?
    update_cookiecode and update_cookiecode == cookiecode
  end
end

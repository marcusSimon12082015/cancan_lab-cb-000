class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to=(readers)
    readers.delete(' ').split(',').each do |reader|
      user = User.find_by(name: reader)
      byebug
      self.readers << user if self.readers.find_by(name: user.name).nil?
    end
  end

  def visible_to
    return self.readers.map(&:name).join(', ')
  end
end

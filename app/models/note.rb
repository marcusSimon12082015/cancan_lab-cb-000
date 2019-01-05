class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to=(readers)
    readers.delete(' ').split(',').each do |reader|
      user = User.find_by(name: reader)
      self.readers << user unless !user.nil?
    end
    byebug
  end

  def visible_to
    return self.readers.map(&:name).join(', ')
  end
end

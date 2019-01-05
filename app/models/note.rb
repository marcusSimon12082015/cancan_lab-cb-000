class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to=(readers)
    readers.delete(' ').split(',').each do |reader|
      self.readers << User.create(name: reader)
    end
  end
end

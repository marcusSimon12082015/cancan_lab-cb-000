class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :ensure_owner_can_read

  def visible_to=(add_readers)
    self.readers = add_readers.split(',').map do |reader|
       User.find_by(name: reader.strip)
     end.compact
  end

  def visible_to
    return self.readers.map(&:name).join(', ')
  end

  private

  def ensure_owner_can_read
    if user && !readers.include?(user)
      readers << user
    end
  end
end

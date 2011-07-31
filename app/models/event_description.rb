class EventDescription
  include Mongoid::Document
  include Mongoid::Timestamps

  validates_presence_of :title

  field :title, :type => String
  field :description, :type => Integer
  field :created_at, :type => DateTime
  field :updated_at, :type => DateTime
  field :disabled, :type => Boolean

  def title_possibly_disabled
    disabled ? title + " (disabled)" : title if title
  end

end

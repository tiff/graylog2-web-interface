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

  def self.find_by_id(_id)
    _id = $1 if /^([0-9a-f]+)-/ =~ _id
    first(:conditions => { :_id => BSON::ObjectId(_id)})
  end

  def to_param
    title.blank? ? id.to_s : "#{id}-#{title.parameterize}"
  end

end

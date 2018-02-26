class Student
  include ActiveModel::Model

  attr_accessor :id, :name, :email, :street_number, :city, :zip_code, :country

  validates :name, presence: true, length: {maximum: 100}
  validates :email, presence: true, length: {maximum: 100}
  validates :street_number, presence: true, length: {maximum: 100}
  validates :city, presence: true, length: {maximum: 100}
  validates :zip_code, presence: true, length: {maximum: 100}
  validates :country, presence: true, length: {maximum: 100}

  def attributes
    [:id, :name, :email, :street_number, :city, :zip_code, :country]
  end

  def save
    return false unless valid?

    self.id = SecureRandom.hex

    true
  end

  def to_param
    id
  end
end

class Course < ActiveRecord::Base
  has_many :subjects, through: :course_subjects, dependent: :destroy
  has_many :course_subjects

  accepts_nested_attributes_for :subjects, :allow_destroy => true

  before_save :default_status

  validates :name, presence: true

  private
  def default_status
  	self.status = 0
  end

end

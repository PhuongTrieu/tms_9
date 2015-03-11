class Course < ActiveRecord::Base
  has_many :subjects, through: :course_subjects, dependent: :destroy
  has_many :users, through: :course_users, dependent: :destroy
  has_many :course_subjects
  has_many :course_users

  accepts_nested_attributes_for :subjects, allow_destroy: true
  accepts_nested_attributes_for :users, allow_destroy: true

  before_save :default_status

  validates :name, presence: true

  private
  def default_status
    self.status = 0
  end
end

class Course < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 50 }
	before_save :default_values
	private
	def default_values
		self.status = 0
	end
end

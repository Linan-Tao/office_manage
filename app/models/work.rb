class Work < ActiveRecord::Base

	# 获取下一道工序
	def next_seq
		Work.where("sequence > ?", self.sequence).order(:sequence).first
	end

end

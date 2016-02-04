class Post < ActiveRecord::Base
	has_many :answers
	
	validates :question, presence: true,
                    length: { minimum: 1 }


end

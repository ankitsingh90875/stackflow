class Post < ActiveRecord::Base
	has_many :answers
	has_many :activities
	validates :question, presence: true,
                    length: { minimum: 1 }


end

class Post < ActiveRecord::Base
	validates :question, presence: true,
                    length: { minimum: 1 }

end

class Answer < ActiveRecord::Base
  belongs_to :word
  has_many :results, dependent: :destroy
end

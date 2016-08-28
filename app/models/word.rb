class Word < ActiveRecord::Base
  has_many :results, dependent: :destroy
  has_many :answers, dependent: :destroy

  default_scope -> {order(created_at: :desc)}

  scope :not_ids, -> ids {where.not id: ids}

  scope :of_category, -> category_id do
    where category_id: category_id if category_id.present?
  end

  scope :learned, -> user_id do
    joins(results: [:lesson]).where(lessons: {user_id: user_id}).uniq!
  end

  scope :not_learn, -> user_id do
    not_ids(Word.learned user_id)
  end

  scope :result_filter, -> user_id, check_learned do
    check_learned == "true" ? learned(user_id) : filter_not_learn(user_id,
      check_learned)
  end

  scope :filter_not_learn, -> user_id, check_learned do
    not_learn(user_id) if check_learned == "false"
  end
end

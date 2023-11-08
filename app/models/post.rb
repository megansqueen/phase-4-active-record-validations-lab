class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
    validate :title_validator

    def title_validator
        clickbait_strings = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        unless clickbait_strings.any? { |string| title&.include?(string)}
            errors.add(:title, "must include clickbait")
        end 
    end

end

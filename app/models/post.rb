class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

    validate :clickbait
    
    def clickbait
        
        unless title && title.include?("Won't Believe")
            errors.add(:title, "no")
        end
    end

end


# && title.include?("Won't Believe" || "Secret" || "Top[number]" || "Guess")
#             errors.add(:title, "no")
#         end
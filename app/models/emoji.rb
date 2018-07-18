class Emoji < ApplicationRecord
    belongs_to :gallery
    
    after_commit :create_emoji_log, on: :create
    after_commit :update_emoji_log, on: :update
    after_commit :destroy_emoji_log, on: :destroy
    
    
    def create_emoji_log
        JobLog.create(user_id: user.id, action: "생성", thing_name: self.title, from: "E")
    end

    def update_emoji_log
        JobLog.create(user_id: user.id, action: "수정", thing_name: self.title, from: "E")
    end
    
    def destroy_emoji_log
        JobLog.create(user_id: user.id, action: "삭제", thing_name: self.title, from: "E")
    end
end

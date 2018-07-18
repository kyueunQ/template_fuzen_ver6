class Gallery < ApplicationRecord
    has_many :emojis
    belongs_to :user
    
    after_commit :create_gallery_log, on: :create
    after_commit :update_gallery_log, on: :update
    after_commit :destroy_gallery_log, on: :destroy
    
    
    def create_gallery_log
        JobLog.create(user_id: user.id, action: "생성", thing_name: self.title, from: "G")
    end

    def update_gallery_log
        JobLog.create(user_id: user.id, action: "수정", thing_name: self.title, from: "G")
    end
    
    def destroy_gallery_log
        JobLog.create(user_id: user.id, action: "삭제", thing_name: self.title, from: "G")
    end
    

end

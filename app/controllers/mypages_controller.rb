class MypagesController < ApplicationController
 layout "application"  
 
    def show
     @job_logs = JobLog.all
    end
    
    
end

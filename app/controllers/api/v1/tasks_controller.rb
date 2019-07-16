module Api::V1
   class TasksController < ApiController
        before_action :set_task, only: [:show, :update, :destroy]
        #before_action :authenticate_user
        def index
            @tasks = Task.all
            render json: @tasks #convert the data to JSON 
        end

        def show 
            render json: @task #convert the data to JSON 
        end
        
        def create
            @task = Task.new(task_params) 
            if @task.save 
                render json: @task
            else
                render json: @task.errors, status: 400
            end
        end

        def update
            if @task.update(task_params)
                render json: @task
            else
                render json: @task.errors, status: 400
            end
        end

        def destroy
            @task.destroy
        end


        private

        def set_task
            @task = Task.find(params[:id])
        end

        def task_params
            params.require(:task).permit(:name, :priority, :due_date, :user_id)
        end





    end
end
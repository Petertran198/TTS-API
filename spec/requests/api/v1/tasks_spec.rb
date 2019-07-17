require 'rails_helper'

RSpec.describe "Task Request", type: :request do 
    describe "tasks API" do 
        let(:homework) {FactoryBot.create(:homework)}
        let(:email) {FactoryBot.create(:email)}
        let(:user) {FactoryBot.create(:user)}
        let(:token) {authentication_token(user)}
        let(:headers) { { AUTHORIZATION: "Bearer #{token}"} }
        it "returns a list of tasks" do 
            task1 = homework
            task2 = email 

            get v1_tasks_path, headers: { AUTHORIZATION: "Bearer #{token}"}

            json = JSON.parse(response.body)
            expect(response).to be_success
            expect(json.length).to eq(2)
        end

        it "returns the requested task " do 
            get v1_task_path(homework.id), headers: headers
            expect(response).to be_success
            json = JSON.parse(response.body)
            expect(json["name"]).to eq("complete homework")
        end

        it "adds a new task " do 
            task_attributes = FactoryBot.attributes_for(:email, user_id: user.id)
            expect {
                post "/v1/tasks", params: {task: task_attributes }, headers: headers
            }.to change(Task, :count).by(1)
        end

    end
end

#get token to authenticate user for api because that is how u configured the api 
def authentication_token(user)
    post "/v1/user_token", params: {auth: {email: user.email, password: user.password}}
    json = JSON.parse(response.body)
    return json['jwt']
end
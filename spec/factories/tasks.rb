FactoryBot.define do
     #class: Task so factories know that the resource is Task 
    factory :homework, class: Task do 
        association :user #owns by user 
        name { "complete homework"}
        priority { 1 }
        due_date { DateTime.now }
    end

     #class: Task so factories know that the resource is Task
    factory :email, class: Task do 
        association :user 
        name { "write an email to Brain "}
        priority { 2 }
        due_date {DateTime.now}
    end

end 
get '/' do
  erb :index
end

post '/issue' do
  issue = Issue.create!(issue_name: params[:issue])
  redirect "/issue/#{issue.id}"
end

get '/issue/:id' do 
  @issue = Issue.find(params[:id])
  erb :'issue/show'
end

post '/issue/:id/pros' do
  issue = Issue.find(params[:id])
  pro = Pro.create(pro_text: params[:pro], importance: params[:importance],issue_id: issue.id)
  if request.xhr?
    erb :'partials/_form_pro', layout:false, locals: {pro: pro,issue:issue}
  else
    redirect "/issue/#{issue.id}"
  end

end

post '/issue/:id/cons' do
  issue = Issue.find(params[:id])
  con = Con.create(con_text: params[:con], importance: params[:importance],issue_id: issue.id)
  if request.xhr?
    erb :'partials/_form_con', layout:false, locals: {con: con, issue:issue}
  else
    redirect "/issue/#{issue.id}"
  end
end

get '/issue/:id/pro/:pro_id' do
  issue = Issue.find(params[:id])
  pro = Pro.find(params[:pro_id])
  pro_id = params[:pro_id].to_i
  pro.destroy
  if request.xhr?

  else
    redirect "/issue/#{issue.id}"
  end

end



get '/issue/:id/con/:con_id' do
  issue = Issue.find(params[:id])
  con = Con.find(params[:con_id])
  con.destroy
  if request.xhr?

  else
    redirect "/issue/#{issue.id}"
  end

end



get '/issue/:id/result' do
  issue = Issue.find(params[:id])
  pros_percentage = issue.pros_percentage.to_s + "%"
  cons_percentage = issue.cons_percentage.to_s + "%"
  result = issue.result

  if request.xhr?
    content_type :json
    {pros_percentage: pros_percentage, cons_percentage: cons_percentage, result:result}.to_json
  else
    redirect "/issue/#{issue.id}"
  end
  
  
end

delete '/issue/:id' do 
  issue = Issue.find(params[:id])
  Pro.destroy_all(issue_id:issue.id)
  Con.destroy_all(issue_id:issue.id)
  if request.xhr?
  else
    redirect "/issue/#{issue.id}"
  end
end








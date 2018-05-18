require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'
require 'open-uri'
require 'nokogiri'

before do
  if Field.count == 0
    Field.create([
      {name: '文系教養科目'},
      {name: '理工系教養科目'},
      {name: '英語科目'},
      {name: '第二外国語科目'},
      {name: '広域教養科目'},
      {name: '教職科目'},
      {name: '日本語・日本文化科目'},
      {name: '数学系'},
      {name: '物理学系'},
      {name: '化学系'},
      {name: '地球惑星科学系'},
      {name: '機械系'},
      {name: 'システム制御系'},
      {name: '電気電子系'},
      {name: '情報通信系'},
      {name: '経営工学系'},
      {name: '材料系'},
      {name: '応用化学系'},
      {name: '数理・計算科学系'},
      {name: '情報工学系'},
      {name: '生命理工学系'},
      {name: '建築学系'},
      {name: '土木・環境工学系'},
      {name: '融合理工学系'},
      {name: '社会・人間科学系'},
      {name: '第1類'},
      {name: '第2類'},
      {name: '第3類'},
      {name: '第4類'},
      {name: '第5類'},
      {name: '第6類'},
      {name: '第7類'}
      ])
  end
  
end

get '/' do
  @fields= Field.all
  erb :index
end

get '/classes/:id' do
  @fields = Field.all
  @field = Field.find(params[:id])
  @field_name = @field.name
  @lessons = @field.lessons
  erb :classes
end

get '/classes/detail/:id' do
  @lesson = Lesson.find(params[:id])
  @lesson_field = Field.find(@lesson.field_id)
  erb :detail
end

get '/post' do
  @fields = Field.all
  @all_lessons = Lesson.all
  erb :contribution
end

post '/src' do
  @search_word = params[:search]
  @l_search = Lesson.where({
    lesson_name: params[:search]
  })
  @t_search = Lesson.where({
    teacher_name: params[:search]
  })
  @d_search = Lesson.where({
    detail: params[:search]
  })
  erb :search
end
  

post '/create' do
  Lesson.create({
    lesson_name: params[:lesson_name],
    teacher_name: params[:teacher_name],
    field_id: params[:field],
    detail: params[:detail],
    attendance: params[:attendance],
    testorreport: params[:testorreport],
    score: params[:score],
    easy: params[:easy]
  })
  redirect '/'
end


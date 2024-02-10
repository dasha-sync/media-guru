# frozen_string_literal: true

require './db/seeds/arrays'

User.find_or_create_by(email: 'admin@example.com') do |user|
  user.username = 'Dasha Admin'
  user.password = 'password'
  user.role = 1
end

50.times.map do |index|
  User.find_or_create_by(email: "user_#{index}@example.com") do |user|
    user.username = Faker::Internet.username
    user.password = 'password'
  end
rescue ActiveRecord::RecordInvalid => e
  Rails.logger.debug e.message
end

Tag.all.each do |i|
  i.destroy
end

TAGS.each do |name|
  Tag.find_or_create_by(
    tag_name: name
  )
end

Language.all.each do |i|
  i.destroy
end

LANGUAGES.each do |name|
  Language.find_or_create_by(
    language_name: name
  )
end

Category.all.each do |i|
  i.destroy
end

CATEGORIES.each do |name|
  Category.find_or_create_by(
    category_name: name
  )
end

Speaker.all.each do |i|
  i.destroy
end

SPEAKERS.each do |fio|
  Speaker.find_or_create_by(
    speaker_fio: fio
  )
end

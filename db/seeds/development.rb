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

GENRES.each do |name|
  Genre.find_or_create_by(
    genre_name: name
  )
end

COUNTRIES.each do |name|
  Country.find_or_create_by(
    country_name: name
  )
end

DIRECTORS.each do |fio|
  Director.find_or_create_by(
    director_fio: fio
  )
end

SPEACKERS.each do |fio|
  Speaker.find_or_create_by(
    speaker_fio: fio
  )
end

SCREENWRITERS.each do |fio|
  Screenwriter.find_or_create_by(
    screenwriter_fio: fio
  )
end

json.extract! profile, :id, :fname, :lname, :gender, :dob, :age, :created_at, :updated_at
json.url profile_url(profile, format: :json)

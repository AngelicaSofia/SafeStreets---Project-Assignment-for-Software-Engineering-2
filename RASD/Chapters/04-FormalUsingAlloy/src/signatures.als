abstract sig Boolean {}
one sig True extends Boolean {}
one sig False extends Boolean {}

sig ViolationCategory {}

sig LicensePlate {}

sig Location {}

sig Picture {}

sig Municipality {
  name: one String,
  province: one String
}

sig User {
  name: one String,
  surname: one String,
  email: one String,
  phoneNumber: lone String,
  password: one String,
  idNumber: one String
}

sig Authority extends User {
  badgeNumber: one String,
  district: one Municipality
}

sig Report {
  pictures: set Picture,
  location: one Location,
  timestamp: one Int,
  author: one User,
  licensePlate: lone LicensePlate,
  violationCategory: one ViolationCategory,
  isValid: one Boolean
}{
  #pictures > 0
}

sig PollAnswer {
  value: one Int,
  author: one User
}{
  -1 <= value && value <= 1
}

sig Poll {
  report: one Report,
  pollAnswers: set PollAnswer,
  isCompleted: one Boolean,
  score: one Int
}{
  (isCompleted = True && #pollAnswers = 10
  || isCompleted = False && #pollAnswers < 10)
  && score = sum pollAnswers.value
}

sig Ticket {
  authority: one Authority,
  report: one Report,
  fine: one Int
}
abstract sig Boolean {}
one sig True extends Boolean {}
one sig False extends Boolean {}

sig ViolationCategory {}

sig LicensePlate {}

sig Location {
  latitude: one Int,
  longitude: one Int
}

sig Picture {}

sig Email {}

sig IdNumber {}

sig PhoneNumber {}

sig CharSeq {}

sig Municipality {
  name: one CharSeq,
  province: one CharSeq
}

sig User {
  name: one CharSeq,
  surname: one CharSeq,
  email: one Email,
  phoneNumber: lone PhoneNumber,
  password: one CharSeq,
  idNumber: one IdNumber
}

sig Authority extends User {
  badgeNumber: one CharSeq,
  district: one Municipality
}

sig Report {
  pictures: set Picture,
  location: one Location,
  timestamp: one Int,
  author: one User,
  licensePlate: lone LicensePlate,
  violationCategory: one ViolationCategory,
  isValid: lone Boolean
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
}

sig Ticket {
  authority: one Authority,
  report: one Report,
  fine: one Int
}

sig Area {
  points: set Location,
  score: one Int,
  reports: set Report
}{
  #points > 0
  #reports > 0
}
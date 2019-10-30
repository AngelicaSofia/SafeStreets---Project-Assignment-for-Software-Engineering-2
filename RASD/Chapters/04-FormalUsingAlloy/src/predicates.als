open facts
open signatures

pred show {}

pred someValidatedReport {
    some p: Poll | one r: Report |
        p.report = r
        && r.isValid = True
        && p.isCompleted = True
}

pred someTickets {
    some t: Ticket | one r: Report |
        t.report = r
        && r.isValid = True
}

pred someAreas {
    #Area = 1
}

run show for 5 but
    exactly 1 Report,
    exactly 2 User,
    exactly 1 Authority,
    exactly 1 LicensePlate,
    exactly 2 PhoneNumber,
    exactly 2 Email
run someValidatedReport for 5
run someTickets for 5
run someAreas for 1
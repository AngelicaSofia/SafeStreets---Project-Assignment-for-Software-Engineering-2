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

run show for 2 but
    exactly 1 Report,
    exactly 2 User,
    exactly 2 IdNumber,
    exactly 1 Authority,
    exactly 1 LicensePlate,
    exactly 2 PhoneNumber,
    exactly 2 Email,
    exactly 1 Municipality
run someValidatedReport for 1 but
    exactly 1 Report,
    exactly 6 User,
    exactly 0 Authority,
    exactly 6 Email,
    exactly 6 IdNumber,
    exactly 5 PollAnswer,
    exactly 1 Poll
run someTickets for 1 but
    exactly 1 Report,
    exactly 6 User,
    exactly 1 Authority,
    exactly 6 Email,
    exactly 6 IdNumber,
    exactly 5 PollAnswer,
    exactly 1 Poll
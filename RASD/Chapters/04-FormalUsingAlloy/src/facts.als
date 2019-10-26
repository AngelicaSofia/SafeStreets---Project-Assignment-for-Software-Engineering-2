open signatures

fact uniqueIdNumber {
    no disj u1, u2: User |
        u1.idNumber = u2.idNumber
}

fact uniqueEmail {
    no disj u1, u2: User |
        u1.email = u2.email
}

fact uniqueBadgeNumber {
    no disj a1, a2: Authority |
        a1.idNumber = a2.idNumber
}

fact uniquePoll {
    no disj p1, p2: Poll |
        p1.report = p2.report 
}

fact onePollPerReport {
    all r: Report | one p: Poll |
        (p.report = r)
}

fact validReport {
    all r: Report | one p: Poll |
        (p.report = r && (r.isValid = True <=> p.score > 15))
}

fact noDoubleVoting {
    all p: Poll | no disj a1, a2: PollAnswer |
        a1 in p.pollAnswers && a2 in p.pollAnswers && a1.author = a2.author
}

fact noMultipleReports {
    all r1, r2: Report |
        (r1.violationCategory = r2.violationCategory 
        && (r1.timestamp > r2.timestamp) 
        && (r1.timestamp - r2.timestamp) < 4)
        => r1.licensePlate != r2.licensePlate
}

fact noMultipleTickets {
    no disj t1, t2: Ticket |
        t1.report = t2.report
}
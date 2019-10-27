open facts
open signatures

assert noDoubleTicketing {
    no disj t1, t2: Ticket |
        t1.report.violationCategory = t2.report.violationCategory 
        && t1.report.timestamp > t2.report.timestamp
        && t1.report.timestamp - t2.report.timestamp < 4
        && t1.report.licensePlate = t2.report.licensePlate
}

check noDoubleTicketing for 10
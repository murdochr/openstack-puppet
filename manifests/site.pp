#import "prereq.pp"
node default {
    notify{'hello':}
    #include prereq 
    include osi
}

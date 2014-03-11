#import "prereq.pp"


node default {
    class { 'osi':
        require =>  Class['osi::repo']
    }
    class { 'osi::repo':
        #require =>  Class['osi']
                }


}

#node default {
#    notify{'hello':}
#    #include prereq 
#    #include osi
#}

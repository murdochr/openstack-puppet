#import 'oss.pp'


node ub-comp-01 {

    stage { 'first':
          before => Stage['main'],
          }
          stage { 'last': }
          Stage['main'] -> Stage['last']

    #class { 'osi::prereq':
    #    before =>  Class['osi::oss']
    #}

    class { 'osi::prereq':
          stage => first,
              }
    class { 'osi::oss':
          stage => last,
    }

    #class { 'osi::oss':
    #    require =>  Class['osi::prereq']
    #}
    #class { 'osi::repo':
    #   before =>  Class['osi::prereq']
    #}


}

#node default {
#    notify{'hello':}
#    #include prereq 
#    #include osi
#}

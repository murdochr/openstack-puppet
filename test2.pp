class optional {
    notify{'Applied optional':}
}

class afterwards {
    notify{'Applied afterwards':}
}

class another_optional {
    notify{'Applied test2':}
}

class testbed {

    if defined(Class['optional']) {
            notify{'You should see both notifications':}
            Class['optional'] -> Class['afterwards']
    }


    if defined(Class['another_optional']) {
            notify{'You should not see this':}
            Class['another_optional'] -> Class['afterwards']
    }
}

node default {
     include optional
     include afterwards
     include testbed
}

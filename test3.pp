class first {
	notify{'first':}
}

class second {
	notify{'second':}
}

class third {
	notify{'third':}
}	 

Class['second'] -> Class['third'] -> Class['first']



node default {
	include first
	include second
	include third
}

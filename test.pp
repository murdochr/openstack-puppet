notify {'hello':}





class dog {
	notify{'test':}
	#require	=> Class['test']
}




class test(
	$server = 'UNSET'
) {

	include dog
	notify{"$server":}
	notify{'blah':}

}

include test

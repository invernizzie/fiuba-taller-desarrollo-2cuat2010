package com.teambook.model
import grails.converters.JSON

class FacebookInfoTagLib {

	def facebookGraphService
	
	//requires param FacebookUID
		def fbPhoto = { attrs -> 
		if (session.facebook) { 
			def photo="<img src='http://graph.facebook.com/"+attrs.facebookUID+"/picture?type=large'/>"
			out << photo

		} else { 
			out << "Not logged in to Facebook" 
		} 
	}

}

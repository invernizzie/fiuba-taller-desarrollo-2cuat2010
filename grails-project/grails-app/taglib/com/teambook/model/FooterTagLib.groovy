package com.teambook.model

class FooterTagLib {
	def thisYear = {
		out << new Date().format("yyyy")
	}

}

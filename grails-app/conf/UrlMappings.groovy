class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        //"/"(view:"/index")
        "500"(view:'/error')

        // data sets
        "/datasetsBenin" (controller: 'public', action: 'dataSetsBenin')

        "/public/resourcesFrance(.$format)"(controller:'public', action:'resourcesFrance')
        "/public/resourcesBenin(.$format)"(controller:'public', action:'resourcesBenin')
	}
}

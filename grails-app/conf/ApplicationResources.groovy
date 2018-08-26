modules = {
    datasets_css {
        resource url: [dir:'css', file:'datasets.css']
    }
    datasets_benin_css {
        resource url: [dir:'css', file:'dataresource_benin.css']
    }
    data_provider {
        resource url: [dir:'css', file:'dataprovider.css']
    }
    data_provider_benin {
        resource url: [dir:'css', file:'dataprovider_benin.css']
    }
    gbiffrance_collectory_css {
        resource url: [dir:'css', file:'gbiffrance-collectory.css']
    }
    institution_css {
        resource url: [dir:'css', file:'institution.css']
    }
    institution_benin{
        resource url: [dir:'css', file:'institution_benin.css']
    }
    datasetsBenin {
        dependsOn 'jquery_i18n'
        resource url:[dir:'js', file:'datasetsBenin.js']
        resource url: [dir:'css', file:'datasets_benin.css']
    }
}
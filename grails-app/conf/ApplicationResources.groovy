modules = {
    datasets_css {
        resource url: [dir:'css', file:'datasets.css']
    }
    datasets_benin_css {
        resource url: [dir:'css', file:'dataresource_benin.css']
    }
    datasets_togo_css {
        resource url: [dir:'css', file:'dataresource_togo.css']
    }
    data_provider {
        resource url: [dir:'css', file:'dataprovider.css']
    }
    data_provider_benin {
        resource url: [dir:'css', file:'dataprovider_benin.css']
    }
    data_provider_togo {
        resource url: [dir:'css', file:'dataprovider_togo.css']
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
    institution_togo{
        resource url: [dir:'css', file:'institution_togo.css']
    }
    datasetsBenin {
        dependsOn 'jquery_i18n'
        resource url:[dir:'js', file:'datasetsBenin.js']
        resource url: [dir:'css', file:'datasets_benin.css']
    }
    datasetsTogo {
        dependsOn 'jquery_i18n'
        resource url:[dir:'js', file:'datasetsTogo.js']
        resource url: [dir:'css', file:'datasets_togo.css']
    }
}